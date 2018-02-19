class AddColumnAmountPendingToCustomerTable < ActiveRecord::Migration[5.1]
  def change
    add_column :customers, :amount_pending, :decimal
  end
end
