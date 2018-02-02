ActiveAdmin.register Vehicle do
  form do |f|
    f.inputs do
      f.input :name
      f.input :kind, as: :radio, collection: ["Two Wheeler", "Three Wheeler", "Four Wheeler"]
      f.input :category, as: :radio, collection: ["SUV", "MUV", "Sedan", "Luxury", "Hatchback","Pickup"]
      f.input :gear, as: :radio, collection: ["Manual", "Automatic"]
      f.input :fuel, as: :radio, collection: ["Diesel", "Electric", "Petrol"]
      f.actions
    end
  end
  controller do
    def permitted_params
      params.permit!
    end
  end
end
