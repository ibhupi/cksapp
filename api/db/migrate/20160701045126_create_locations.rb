class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :title
      t.string :lattitude
      t.string :longitude
      t.string :description
      t.integer :ranking
      t.integer :photo

      t.timestamps null: false
    end
  end
end
