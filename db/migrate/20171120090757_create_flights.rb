class CreateFlights < ActiveRecord::Migration[5.0]
  def change
    create_table :flights do |t|
      t.references :user, foreign_key: true
      t.references :jet, foreign_key: true
      t.string :origin
      t.string :destination
      t.datetime :departure
      t.datetime :arrival
      t.integer :price
      t.string :status

      t.timestamps
    end
  end
end
