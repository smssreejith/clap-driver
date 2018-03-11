class AddAgencyColumntoDriver < ActiveRecord::Migration[5.1]
  def change
    add_column :drivers, :agency_id, :integer
  end
end
