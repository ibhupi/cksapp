class CreateCountries < ActiveRecord::Migration
  def change
    create_table :countries do |t|
      t.string :name
      t.integer :photo

      t.timestamps null: false
    end
  end
end
