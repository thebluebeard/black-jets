class AddTimeToFlights < ActiveRecord::Migration[5.0]
  def change
    add_column :flights, :arrival_time, :time
    add_column :flights, :departure_time, :time
  end
end
