ActiveAdmin.register Customer do
  form do |f|
    f.inputs "Personal Info" do
      f.input :name
      f.input :sex, as: :radio, collection: ["Male", "Female"]
      f.input :age
    end
    f.inputs "Contact Details" do
      f.input :contact_number
      f.input :alternate_number
      f.input :email
      f.input :home_address
      f.input :office_address
      f.input :location
    end
    f.inputs do
      f.input :refferal_type, as: :radio, collection: ["Medium", "Person"]
      f.input :refferal
      f.input :executive
    end
    f.inputs do
      f.input :profession
      f.input :experience
      f.input :enterprise
      f.input :current_provider
    end
    f.inputs "Vehicle" do
      f.input :vehicle_kind
      f.input :vehicle_no
      f.input :vehicle_brand
      f.input :vehicle_model
      f.input :vehicle_color, as: :color_picker
      f.input :vehicle_gear_type
      f.input :vehicle_no_of_gears
      f.input :vehicle_other
    end
    f.inputs "Cab" do
      f.input :cab_name
      f.input :cab_agent
      f.input :cab_rate
      f.input :cab_total_distance
      f.input :cab_total_fare
      f.input :cab_kind
      f.input :cab_no
      f.input :cab_brand
      f.input :cab_model
      f.input :cab_color, as: :color_picker
      f.input :cab_gear_type
      f.input :cab_no_of_gears
    end
    f.inputs do
      f.input :requirement
      f.input :remarks
      f.input :review
      f.input :rating
      f.input :suggestions
      f.input :insights
      f.input :to_do
      f.input :last_communication, as: :date_time_picker
      f.input :call_back, as: :date_time_picker
      f.input :status
      f.input :discounts
      f.actions
    end
  end
  controller do
    def permitted_params
      params.permit!
    end
  end
end
