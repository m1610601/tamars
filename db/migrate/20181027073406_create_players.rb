class CreatePlayers < ActiveRecord::Migration[5.2]
  def change
    create_table :players do |t|
      t.string :name
      t.integer :admission_year
      t.integer :uniform_number
      t.text :image_url
      t.integer :position_id
      t.timestamps null: false
    end
  end
end
