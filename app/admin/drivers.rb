ActiveAdmin.register Driver do
  form do |f|
    f.inputs "Personal Info" do
      f.input :name
      f.input :age
    end
    f.inputs "Contact" do
      f.input :contact_number
      f.input :alternate_contact
      f.input :native
      f.input :location
      f.input :district
    end
    f.inputs "Agenct" do
      f.input :agency
      f.input :old_agency
      f.input :agency_contact_number
      f.input :agency_alternated_number
    end
    f.inputs do
      f.input :enrollment_status
      f.input :reference
    end
    f.inputs "Feedback" do
      f.input :general_review
      f.input :rating
      f.input :notes
    end
    f.inputs "Traits" do
      f.input :traits_responsible
      f.input :traits_punctual
      f.input :traits_behaviour
      f.input :traits_driving
      f.input :traits_route_knowledge
      f.input :traits_cleanliness
    end
    f.inputs "Plans" do
      f.input :plan, collection: ["Daily","Hourly","Slab"]
      f.input :daily_charge
      f.input :monthy_charge
      f.input :slab
      f.actions
    end
  end

  controller do
    def permitted_params
      params.permit!
    end
  end
end
