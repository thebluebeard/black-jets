class ChangeDateTypeOnFlights < ActiveRecord::Migration[5.0]
  def change
    change_column :flights, :departure, :datetime
    change_column :flights, :arrival, :datetime
  end
end
