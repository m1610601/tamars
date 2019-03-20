class CreateActivities < ActiveRecord::Migration[5.2]
  def change
    create_table :activities do |t|
      t.string :title
      t.text :description
      t.text :twitter_url
      t.datetime :date
      t.text :image_url
      t.timestamps null: false
    end
  end
end
