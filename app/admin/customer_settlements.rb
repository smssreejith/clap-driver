ActiveAdmin.register CustomerSettlement do
  index do
    selectable_column
    column :id
    column :customer
    column :amount do |amt|
      amt.amount&.abs
    end
    column "TO" do |settlement|
      if settlement.amount.to_i < 0
        message = "Customer"
      else
        message = "Clap"
      end
      "#{message}"
    end
    column :booking_id
    actions
  end
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

  controller do
    def permitted_params
      params.permit!
    end
  end
end
