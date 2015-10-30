class Product < ActiveRecord::Base
  belongs_to :farm

  validates :item, presence: true
  validates :quantity, length: { maximum: 15 }
  validates :price, numericality: true
  # validates :expiration, timeliness: { on_or_after labmda { Date.current }, type: :date }
end
