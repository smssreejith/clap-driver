class CreateAgencies < ActiveRecord::Migration[5.1]
  def change
    create_table :agencies do |t|
      t.string :name
      t.string :contact_number
      t.string :alternate_number
      t.decimal :amount_pending

      t.timestamps
    end
  end
end
