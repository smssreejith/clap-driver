class CreateVehicles < ActiveRecord::Migration[5.1]
  def change
    create_table :vehicles do |t|
      t.string :name
      t.string :kind
      t.string :category
      t.string :gear
      t.string :fuel

      t.timestamps
    end
  end
end
