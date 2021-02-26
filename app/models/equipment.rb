class Equipment < ApplicationRecord
  belongs_to :user
  has_many :rentals, dependent: :destroy
  before_destroy :purge_photo
  has_many :rentals

  has_one_attached :photo

  validates :name, :description, :price_per_day, presence: true
  validates :price_per_day, numericality: { only_integer: true, greater_than: 0 }
  validates :category, inclusion: { in: %w[Gym Racket Camping],
    message: "%{value} is not one of three categories" }

  include PgSearch::Model
  pg_search_scope :search_by_equipment,
  against: %i[name description],
  using: {
    tsearch: { prefix: true }
  }

  def unavailable_dates
    rentals.pluck(:start_date, :end_date).map do |range|
      { from: range[0], to: range[1] }
    end
  end

  private

  def purge_photo
    photo.purge
  end
end
