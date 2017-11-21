class AddCapacityToFlights < ActiveRecord::Migration[5.0]
  def change
    add_column :flights, :capacity, :integer
  end
end
