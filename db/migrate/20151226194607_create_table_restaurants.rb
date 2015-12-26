class CreateTableRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name, null: false
      t.string :email
      t.belongs_to :user, null: false
      t.string :phone
      t.string :address
      t.string :city
      t.string :state
      t.string :zip

      t.timestamps null: false
    end
    add_index :restaurants, :name, { unique: true }
  end
end
