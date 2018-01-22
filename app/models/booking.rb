class Booking < ApplicationRecord
  belongs_to :customer
  belongs_to :vehicle
  belongs_to :driver
end
