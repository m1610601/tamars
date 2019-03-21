class CreateMember < ActiveRecord::Migration[5.2]
  def change
    create_table :members do |t|
      t.string :name
      t.integer :enter_year
      t.string :
      t.timestamps null: false
    end
  end
end
