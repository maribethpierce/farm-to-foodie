class AddColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :farmer, :boolean, default: false
    add_column :users, :name, :string, null: false
    add_column :users, :foodie, :boolean, default: false
  end
end
