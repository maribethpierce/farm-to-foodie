class Market < ActiveRecord::Base
  belongs_to :farm

  validates :day_of_week, presence: true
  validates :location, presence: true
  validates :location, length: { maximum: 50 }
end
