class CreateBookings < ActiveRecord::Migration[5.1]
  def change
    create_table :bookings do |t|
      t.datetime :booking_time
      t.references :customer, foreign_key: true
      t.string :ride_status
      t.string :contact_number
      t.string :alternate_number
      t.string :todo_action
      t.datetime :todo_datetime
      t.string :referal_enterprise
      t.string :referal_name
      t.string :executive
      t.datetime :requirement_start
      t.datetime :requirement_end
      t.string :duration
      t.references :vehicle, foreign_key: true
      t.string :vehicle_number
      t.string :pickup_car
      t.string :pickup_poc_name
      t.string :pickup_poc_contact
      t.string :pickup_location
      t.string :pickup_landmark
      t.string :drop_car
      t.string :drop_customer
      t.string :drop_location
      t.string :drop_landmark
      t.string :drop_poc_name
      t.string :drop_poc_contact
      t.text :purpose
      t.text :additional_requirement
      t.string :plan_name
      t.string :plan_min_hr
      t.decimal :plan_min_amount
      t.string :plan_extra_hr
      t.decimal :plan_additional_charges
      t.string :plan_commute_charge_km
      t.decimal :plan_commute_charge_amount
      t.decimal :driver_food_accomodation
      t.text :driver_text_info
      t.string :ride_start_point
      t.datetime :ride_reporting_time
      t.datetime :ride_start
      t.datetime :ride_end
      t.string :ride_duration
      t.string :ride_touch_points_location
      t.string :ride_end_point
      t.integer :ride_no_of_passengers
      t.references :driver, foreign_key: true
      t.string :ride_agency
      t.string :ride_driver_transport_start_medium
      t.decimal :ride_driver_transport_start_amount
      t.string :ride_driver_transport_drop_medium
      t.decimal :ride_driver_transport_drop_amount
      t.string :on_ride_duration
      t.decimal :on_ride_amount
      t.string :pre_ride_duration
      t.decimal :pre_ride_duration_amount
      t.string :pre_ride_distance
      t.decimal :pre_ride_distance_amount
      t.string :post_ride_duration
      t.decimal :post_ride_duration_amount
      t.string :post_ride_distance
      t.decimal :post_ride_distance_amount
      t.decimal :food_charges
      t.decimal :accomodation_charges
      t.decimal :toll_parking_charges
      t.decimal :other_charges
      t.decimal :tip_charges
      t.decimal :total_waiver
      t.decimal :clap_waiver
      t.decimal :net_billing
      t.string :payment_collected_by
      t.decimal :collected_from_customer
      t.decimal :expense
      t.decimal :driver_expense
      t.decimal :after_expense_trip
      t.decimal :clap_expenses
      t.decimal :agency_share
      t.decimal :driver_payment
      t.decimal :clap_share
      t.decimal :balance
      t.string :collection_status
      t.string :feedback_customer
      t.string :feedback_driver
      t.string :suggestions_customer
      t.string :suggestions_driver
      t.string :insights
      t.string :todo
      t.text :other_info

      t.timestamps
    end
  end
end
