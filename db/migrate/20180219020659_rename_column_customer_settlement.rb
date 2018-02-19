class RenameColumnCustomerSettlement < ActiveRecord::Migration[5.1]
  def change
    rename_column :customer_settlements, :driver_id, :customer_id
  end
end
