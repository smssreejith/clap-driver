class AddColumnDiscountToBooking < ActiveRecord::Migration[5.1]
  def change
    add_column :bookings, :discount, :decimal
  end
end
