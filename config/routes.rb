Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  post '/order_changes', to: 'order_changes#create_order_change'
end
