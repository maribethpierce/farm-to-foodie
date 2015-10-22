class Farm < ActiveRecord::Base
  has_one :user
  has_many :products
  has_many :orders
  has_many :foodies, through: :orders
  has_many :markets

  validates :name, presence: true
  validates :email, uniqueness: true
  validates :user, presence: true
  validates :phone, numericality: true
  validates :address, length: { maximum: 40 }
  validates :city, length: { maximum: 25 }
  validates :state, length: { maximum: 2 }
  validates :zip, numericality: true, length: { is: 5 }
end
