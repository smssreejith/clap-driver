class RemoveColumnsFromDriver < ActiveRecord::Migration[5.1]
  def change
    remove_column :drivers, :agency
    remove_column :drivers, :agency_contact_number
    remove_column :drivers, :agency_alternated_number
  end
end
