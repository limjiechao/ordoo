Rails.application.routes.draw do
  root 'index#index'

  get 'orders/index'

  get 'orders/show'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :orders, only: [:index, :show]
end
