class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :name
      t.string :gender
      t.string :gamesList
      t.integer :country
      t.integer :photo

      t.timestamps null: false
    end
  end
end
