class AddRestaurantToUser < ActiveRecord::Migration
  def change
    add_column :users, :restaurant, :boolean, default: false
  end
end
