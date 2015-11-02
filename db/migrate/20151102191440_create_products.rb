class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :item, null: false
      t.string :quantity
      t.float :price
      t.belongs_to :farm, null: false
      t.date :expiration
      t.timestamps
    end
  end
end
