class User < ActiveRecord::Base
  has_one :farm
  has_many :orders
  has_one :restaurant

  validates :email, uniqueness: true
  validates :name, presence: true
  validates :farmer, inclusion: [true, false]
  validates :foodie, inclusion: [true, false]
  validates :restaurant, inclusion: [true, false]

  def farmer?
    farmer
  end

  def foodie?
    foodie
  end

  def admin?
    admin
  end

  def restauranter?
    restauranter
  end

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
end
