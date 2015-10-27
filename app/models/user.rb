class User < ActiveRecord::Base
  has_one :farm
  has_many :orders

  validates :email, uniqueness: true
  validates :name, presence: true
  validates :farmer, inclusion: [true, false]
  validates :foodie, inclusion: [true, false]

  def farmer?
    farmer
  end

  def foodie?
    foodie
  end

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
end
