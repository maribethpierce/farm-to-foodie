class Market < ActiveRecord::Base
  belongs_to :farm

  validates :day_of_week, presence: true
  validates :location, presence: true
  validates :location, length: { maximum: 50 }
  validates :location, length: { minimum: 4 }
  validates :address, length: { maximum: 40 }
  validates :address, length: { minimum: 10 }
  validates :city, length: { maximum: 25 }
  validates :city, length: { minimum: 3 }
  validates :state, length: { maximum: 2 }
  validates :state, length: { minimum: 2 }
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
