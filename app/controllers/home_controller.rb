class HomeController < ApplicationController
  def contact_number
    @customer = Customer.find(params[:customer_id])
    respond_to do |format|
      format.json {render json: {contact_number: @customer.contact_number, alternate_number: @customer.alternate_number, vehicle_number: @customer.vehicle_no, vehicle: @customer.vehicle_id}}
    end
  end
end
