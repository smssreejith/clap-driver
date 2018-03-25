ActiveAdmin.register Booking do
  form do |f|
    f.inputs do
      f.input :booking_time, as: :date_time_picker
      f.input :customer
      f.input :ride_status, collection: ["Enquiry", "Booking Confirmed", "Cancelled", "Cancelled with Charges", "Feedback Pending", "On Ride", "Completed", "Payment Pending", "Agent Assigned", "Driver Assigned", "Driver Reported", "Driver Started"]
      f.input :contact_number  #number automatic
      f.input :alternate_number #alernerate_automatic
      f.input :todo_action
      f.input :todo_datetime, as: :date_time_picker
      f.input :referal_enterprise, label: "Job description" # rename to job_description # done
      f.input :referal_name
      f.input :executive
    end
    f.inputs "Requirement" do
      f.input :requirement_start, as: :date_time_picker
      f.input :requirement_end, as: :date_time_picker
      f.input :duration #auto calculate #done
      f.input :vehicle #vehicle automatic auto suggest from vehicles table
      f.input :vehicle_number
      f.input :pickup_car
      f.input :pickup_poc_name
      f.input :pickup_poc_contact
      f.input :pickup_location
      f.input :pickup_landmark
      f.input :drop_car
      f.input :drop_customer
      f.input :drop_location
      f.input :drop_landmark
      f.input :drop_poc_name
      f.input :drop_poc_contact
      f.input :purpose
      f.input :additional_requirement
    end
    f.inputs "Plan Details" do
      f.input :plan_name
      f.input :plan_min_hr
      f.input :plan_min_amount
      f.input :plan_extra_hr
      f.input :plan_additional_charges
      f.input :plan_commute_charge_km
      f.input :plan_commute_charge_amount
      f.input :driver_food_accomodation
    end
    f.inputs "Ride Details" do
      f.input :ride_type, collection: ["Continous", "Trip"], selected: "Continous"
      # update from requirement
      f.input :ride_start_point
      f.input :ride_reporting_time, as: :date_time_picker
      f.input :ride_start, as: :date_time_picker
      f.input :ride_end, as: :date_time_picker
      f.input :ride_duration #done
      f.input :ride_touch_points_location
      f.input :ride_end_point
      f.input :ride_no_of_passengers
      f.input :driver
      f.input :ride_agency
      f.input :ride_driver_transport_start_medium
      f.input :ride_driver_transport_start_amount
      f.input :ride_driver_transport_drop_medium
      f.input :ride_driver_transport_drop_amount
      f.input :driver_text_info
    end
    f.inputs "Total Revenue" do
      f.input :on_ride_duration #ride_end - ride_start #done
      f.input :on_ride_amount # on_ride_duration * 100 (8am to 6pm min 3hr 300 addional 100/hr) 6pm to 8am min 3hr 400 additional 100/hr # done
      f.input :pre_ride_duration
      f.input :pre_ride_duration_amount # 100/hr #done
      f.input :pre_ride_distance
      f.input :pre_ride_distance_amount 
      f.input :post_ride_duration
      f.input :post_ride_duration_amount # 100/hr
      f.input :post_ride_distance
      f.input :post_ride_distance_amount
      f.input :food_charges
      f.input :accomodation_charges
      f.input :toll_parking_charges, label: "Toll/Parking" # rename label toll/parking #done
      f.input :other_charges
      f.input :tip_charges
      f.input :total_waiver, label: "Clap + Driver Waiver" #(label clap + driver)
      f.input :clap_waiver
      f.input :net_billing # above amount - total waiver - clap waiver
    end
    f.inputs "Payments" do
      f.input :payment_collected_by, collection: ["Driver", "Clap", "Agent", "Pending"]
      f.input :collected_from_customer, label: "Amount Collected from Customer" # rename to amount collecteted from customer #done
      f.input :expense # pre_ride_duration_amount + post_ride_duration_amount + food_charges + accomodation_charges + toll_parking_charges + total_waiver + clap_waiver #done
      f.input :driver_expense # execpt clap waiver #done
      f.input :after_expense_trip  # net_billing - expense #done
      f.input :clap_expenses # clap_waiver #done
      #f.input :agency_share # backend code based on logic
      #f.input :driver_payment # backend code based on logic
      #f.input :clap_share # net_billing - driver or agency share
      #f.input :balance # net_billing - collected_from_customer
      f.input :collection_status, label: "Settlement Status", collection: ["Pending", "Partially Collected", "Collected"] # rename label to settlement status
    end
    f.inputs "Feedback" do
      f.input :feedback_customer
      f.input :feedback_driver
    end
    f.inputs "Feedback" do
      f.input :suggestions_customer
      f.input :suggestions_driver
    end
    f.inputs do
      f.input :insights
      f.input :todo
      f.input :other_info
      f.actions
    end
  end
  controller do
    def permitted_params
      params.permit!
    end
  end
end
