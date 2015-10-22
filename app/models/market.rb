class Market < ActiveRecord::Base
  belongs_to :farm

  validates :day_of_week, presence: true,
  validates :day_of_week, inclusion: { in: %w(Monday Tuesday Wednesday Thursday Friday Saturday Sunday),
    message: "%{value} is not a valid day" }
  validates :location, presence: true
  validates :location, length: { maximum: 50 }
end
