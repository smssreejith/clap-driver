class CreateDrivers < ActiveRecord::Migration[5.1]
  def change
    create_table :drivers do |t|
      t.string :name
      t.string :agency
      t.string :old_agency
      t.string :enrollment_status
      t.string :reference
      t.integer :age
      t.string :native
      t.string :location
      t.string :district
      t.string :contact_number
      t.string :alternate_contact
      t.string :agency_contact_number
      t.string :agency_alternated_number
      t.string :general_review
      t.string :rating
      t.text :notes
      t.string :traits_responsible
      t.string :traits_punctual
      t.string :traits_behaviour
      t.string :traits_driving
      t.string :traits_route_knowledge
      t.string :traits_cleanliness

      t.timestamps
    end
  end
end
