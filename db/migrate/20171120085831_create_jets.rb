class CreateJets < ActiveRecord::Migration[5.0]
  def change
    create_table :jets do |t|
      t.references :user, foreign_key: true
      t.string :plane_model
      t.integer :seat_number
      t.integer :production_year
      t.string :wifi
      t.string :meal
      t.string :img_url
      t.string :description

      t.timestamps
    end
  end
end
