class AddColumnBookingIdToSettlementTable < ActiveRecord::Migration[5.1]
  def change
    add_column :driver_settlements, :booking_id, :integer
    add_column :customer_settlements, :booking_id, :integer
  end
end
