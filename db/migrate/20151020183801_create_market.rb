class CreateMarket < ActiveRecord::Migration
  def change
    create_table :market do |t|
      t.string :day_of_week, null: false
      t.string :location, null: false
      t.belongs_to :farm
    end
  end
end
