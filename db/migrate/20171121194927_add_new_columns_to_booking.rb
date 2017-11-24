class AddNewColumnsToBooking < ActiveRecord::Migration[5.0]
  def change
    add_column :bookings, :surname, :string
    add_column :bookings, :given_name, :string
    add_column :bookings, :id_type, :string
    add_column :bookings, :id_number, :string
    add_column :bookings, :date_of_birth, :datetime
    add_column :bookings, :payment_method, :string
  end
end
