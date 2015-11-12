Rails.application.routes.draw do
  resources :items, only: [:index]
  resources :categories, only: [:show]
  resources :cart_items, only: [:create, :show, :index, :update]

end
