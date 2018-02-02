class AddVehicletoCustomerTable < ActiveRecord::Migration[5.1]
  def change
    add_reference :customers, :vehicle
  end
end
