class AddColumnRideTypeToBookingTable < ActiveRecord::Migration[5.1]
  def change
    add_column :bookings, :ride_type, :string
  end
end
