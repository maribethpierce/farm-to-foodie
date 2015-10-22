class User < ActiveRecord::Base
  has_one :farm
  has_many :orders

  validates :email, uniqueness: true
  validates :name, presence: true
  validates :farmer, inclusion: [true, false]
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  def farmer?
    farmer
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
