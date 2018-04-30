class DriverSettlement < ApplicationRecord
  belongs_to :driver
  after_commit :update_driver_create, on: [:create]
  after_commit :update_driver_update, on: [:update]

  def update_driver_create
    driver = Driver.find(driver_id)
    driver.update_attributes(amount_pending: (driver.amount_pending.to_i + amount))
    driver.agency.update_attributes(amount_pending: (driver.agency.amount_pending.to_i + amount))
  end

  def update_driver_update
    driver = Driver.find(driver_id)
    driver.update_attributes(amount_pending: (driver.amount_pending.to_i + amount - amount_was))
    driver.agency.update_attributes(amount_pending: (driver.agency.amount_pending.to_i + amount - amount_was))
  end
end
