class Product < ActiveRecord::Base
  belongs_to :farm

  validates :item, presence: true
  validates :quantity, length: { maximum: 15 }
  validates :price, numericality: true
  validates :price, length: { maximum: 5 }

  def self.search(query)
    where("item ILIKE ?", "%#{query}%")
  end
end
