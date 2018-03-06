class Booking < ApplicationRecord
  belongs_to :customer
  belongs_to :vehicle
  belongs_to :driver
  after_commit :calculate_share

  def calculate_share
    return unless self.ride_status == "Completed"
    driver = Driver.find(self.driver_id) 
    customer = Customer.find(self.customer_id) 
    case driver.plan
    when "Daily"
      self.agency_share = self.after_expense_trip
      self.driver_payment = self.after_expense_trip
      self.clap_share = 0
    when "Monthly"
      self.agency_share = self.after_expense_trip
      self.driver_payment = self.after_expense_trip
      self.clap_share = 0
    when "Slab"
      share = if driver.slab.slab_1_to.present? and self.after_expense_trip.to_i > driver.slab.slab_1_from.to_i and self.after_expense_trip.to_i < driver.slab.slab_1_to.to_i
                (driver.slab.slab_1_amount * self.after_expense_trip) / 100
              elsif driver.slab.slab_2_to.present? and self.after_expense_trip.to_i > driver.slab.slab_2_from.to_i and self.after_expense_trip.to_i < driver.slab.slab_2_to.to_i
                (driver.slab.slab_2_amount * self.after_expense_trip) / 100
              elsif driver.slab.slab_3_to.present? and self.after_expense_trip.to_i > driver.slab.slab_3_from.to_i and self.after_expense_trip.to_i < driver.slab.slab_3_to.to_i
                (driver.slab.slab_3_amount * self.after_expense_trip) / 100
              elsif driver.slab.slab_4_to.present? and self.after_expense_trip.to_i > driver.slab.slab_4_from.to_i and self.after_expense_trip.to_i < driver.slab.slab_4_to.to_i
                (driver.slab.slab_4_amount * self.after_expense_trip) / 100
              elsif driver.slab.slab_5_to.present? and self.after_expense_trip.to_i > driver.slab.slab_5_from.to_i and self.after_expense_trip.to_i < driver.slab.slab_5_to.to_i
                (driver.slab.slab_5_amount * self.after_expense_trip) / 100
              end
      self.agency_share = share
      self.driver_payment = share
      self.clap_share = self.after_expense_trip - share
    end

    if driver.plan == "Daily"
      ride_start = self.ride_start.strftime("%Y%m%d").to_i
      ride_end = self.ride_end.strftime("%Y%m%d").to_i
      daily_amount = - ((ride_end - ride_start + 1) * driver.daily_charge)
      DriverSettlement.create(booking_id: 0, driver_id: self.driver_id, amount: daily_amount)
    elsif driver.plan == "Salaried"
      unless DriverSettlement.where(booking_id: 0).last.created_at.strftime("%Y%m") == Time.now.strftime("%Y%m")
        DriverSettlement.create(booking_id: 0, driver_id: self.driver_id, amount: driver.monthly_charge)
      end
    elsif driver.plan == "Monthly"
      unless DriverSettlement.where(booking_id: 0).last.created_at.strftime("%Y%m") == Time.now.strftime("%Y%m")
        DriverSettlement.create(booking_id: 0, driver_id: self.driver_id, amount: - driver.monthly_charge)
      end
    end

    customer_pending_amount = self.net_billing.to_i - self.collected_from_customer.to_i
    driver_settlement = DriverSettlement.find_by_booking_id(self.id)
    customer_settlement = CustomerSettlement.find_by_booking_id(self.id)
    if ["Driver", "Agent"].include? self.payment_collected_by
      amount = customer_pending_amount - self.clap_share
    else
      amount = self.clap_share - self.net_billing
    end
    if driver_settlement.blank?
      DriverSettlement.create(booking_id: self.id, driver_id: self.driver_id, amount: amount)
      CustomerSettlement.create(booking_id: self.id, customer_id: self.customer_id, amount: customer_pending_amount)
      driver.update_attributes(amount_pending: (driver.amount_pending.to_i + amount))
      customer.update_attributes(amount_pending: (customer.amount_pending.to_i + customer_pending_amount))
    else
      previous_amount_driver = driver_settlement.amount
      previous_amount_customer = customer_settlement.amount

      driver_settlement.update_attributes(booking_id: self.id, driver_id: self.driver_id, amount: amount)
      customer_settlement.update_attributes(booking_id: self.id, customer_id: self.customer_id, amount: customer_pending_amount)

      driver.update_attributes(amount_pending: (driver.amount_pending.to_i + amount - previous_amount_driver))
      customer.update_attributes(amount_pending: (customer.amount_pending.to_i + customer_pending_amount - previous_amount_customer))
    end
  end
end
