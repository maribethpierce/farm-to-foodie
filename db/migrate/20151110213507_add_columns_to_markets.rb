class AddColumnsToMarkets < ActiveRecord::Migration
  def change
    add_column :markets, :address, :string
    add_column :markets, :city, :string
    add_column :markets, :state, :string
    add_column :markets, :zip, :string
    add_column :markets, :latitude, :float
    add_column :markets, :longitude, :float
  end
end
