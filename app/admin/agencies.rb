ActiveAdmin.register Agency do
  index do
    selectable_column
    column :id
    column :name
    column :contact_number
    column :alternate_number
    column :amount_pending do |amt|
      amt.amount_pending&.abs
    end
    column "TO" do |amt|
      if amt.amount_pending.to_i < 0
        message = "Clap"
      else
        message = "Agency"
      end
      "#{message}"
    end
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
