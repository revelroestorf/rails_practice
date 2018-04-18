Rails.application.routes.draw do

  root to: 'products#index'

  devise_for :users
  resources :carts
  resources :products

  resources :admin_users

  # match 'admin/carts', to: 'admin_users#carts', via: :get

  get ':controller(/:action(/:id))'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
