class ChangeDateAndTime < ActiveRecord::Migration[5.0]
  def change
    change_column :flights, :departure, :date
    change_column :flights, :arrival, :date
  end
end
