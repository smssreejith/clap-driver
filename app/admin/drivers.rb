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
    f.inputs "Agency" do
      f.input :agency
      f.input :old_agency, collection: Agency.all.map{|x| [x.name, x.id]}
    end
    f.inputs do
      f.input :enrollment_status,
        collection: ["On hold", "Awaiting Doc", "Completed","Rejected","Blacklisted"]
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
      f.input :plan, collection: ["Daily","Monthly","Slab", "Salaried", "Fixed per ride"]
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
