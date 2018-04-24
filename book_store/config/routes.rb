Rails.application.routes.draw do

  devise_for :users
  root 'pages#index'

  get 'pages/authors'

  get 'pages/books'

  get ':controller/:action/:id'

  get 'pages/author_books'

  get 'pages/stores', to: 'pages#stores', as: 'stores'

  get 'pages/show_store'

  post 'pages/location'

  get 'pages/show_book'

  resources :charges




  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
