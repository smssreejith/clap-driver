Rails.application.routes.draw do
  root to: "admin/dashboard#index"
  post 'home/contact_number', defaults: { format: :json }
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
