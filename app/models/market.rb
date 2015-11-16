class Market < ActiveRecord::Base
  belongs_to :farm

  validates :day_of_week, presence: true
  validates :location, presence: true
  validates :location, length: { maximum: 50 }
  validates :address, length: { maximum: 40 }
  validates :city, length: { maximum: 25 }
  validates :state, length: { maximum: 2 }
  validates :zip, numericality: true, length: { is: 5 }
  validates :longitude, numericality: true
  validates :latitude, numericality: true

  # attr_accessible :address, :city, :state, :zip, :latitude, :longitude
  after_validation :geocode, :if => :address_changed?
  geocoded_by :full_address
  def full_address
    "#{address}, #{city}, #{state}, #{zip}"
  end

end
