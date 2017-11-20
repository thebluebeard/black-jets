class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.references :flight, foreign_key: true
      t.integer :ambiance_rating
      t.integer :service_rating
      t.string :description
      t.string :img_url

      t.timestamps
    end
  end
end
