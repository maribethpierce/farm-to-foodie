class Farm < ActiveRecord::Base
# extend ::Geocoder::Model::ActiveRecord
  belongs_to :user
  has_many :products
  has_many :orders
  has_many :foodies, through: :orders
  has_many :markets
  has_one :mapmarker

  validates :name, presence: true
  validates :email, uniqueness: true
  validates :user, presence: true
  validates :phone, numericality: true
  validates :address, length: { maximum: 40 }
  validates :city, length: { maximum: 25 }
  validates :state, length: { maximum: 2 }
  validates :zip, numericality: true, length: { is: 5 }
  validates :longitude, numericality: true
  validates :latitude, numericality: true

  # attr_accessible :address, :city, :state, :zip, :latitude, :longitude
  after_validation :geocode #, :if => :address_changed?
  geocoded_by :full_address
  def full_address
    "#{address}, #{city}, #{state}, #{zip}"
  end
end
