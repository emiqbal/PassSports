class Equipment < ApplicationRecord
  belongs_to :user

  has_one_attached :photo
  
  validates :name, :description, :price_per_day, presence: true
  validates :price_per_day, numericality: { only_integer: true, greater_than: 0 }
end
