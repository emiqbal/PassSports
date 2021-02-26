class Rental < ApplicationRecord
  belongs_to :equipment
  belongs_to :user

  validate :end_date_before_start_date

  def end_date_before_start_date
    return errors.add(:end_date, "must be after the start date") if end_date < start_date
  end
end
