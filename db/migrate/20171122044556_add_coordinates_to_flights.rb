class AddCoordinatesToFlights < ActiveRecord::Migration[5.0]
  def change
    add_column :flights, :latitude, :float
    add_column :flights, :longitude, :float
  end
end
