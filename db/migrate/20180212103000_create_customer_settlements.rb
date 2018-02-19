class CreateCustomerSettlements < ActiveRecord::Migration[5.1]
  def change
    create_table :customer_settlements do |t|
      t.references :driver, foreign_key: true
      t.decimal :amount

      t.timestamps
    end
  end
end
