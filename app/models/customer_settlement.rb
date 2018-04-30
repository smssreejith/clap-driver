class CustomerSettlement < ApplicationRecord
  belongs_to :customer
  after_commit :update_customer_create, on: [:create]
  after_commit :update_customer_update, on: [:update]

  def update_customer_create
    customer = Customer.find(customer_id)
    customer.update_attributes(amount_pending: (customer.amount_pending.to_i + amount))
  end

  def update_customer_update
    customer = Customer.find(customer_id)
    customer.update_attributes(amount_pending: (customer.amount_pending.to_i + amount - amount_was))
  end
end
