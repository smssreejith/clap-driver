class AddCloumnToDriversTable < ActiveRecord::Migration[5.1]
  def change
    add_column :drivers, :plan, :string
    add_column :drivers, :daily_charge, :decimal
    add_column :drivers, :monthy_charge, :decimal
    add_reference :drivers, :slab 
    add_column :drivers, :amount_pending, :decimal
  end
end
