Rails.application.routes.draw do
  get '/', to: 'home#index'
  get '/login', to: 'session#new'
  post '/login', to: 'session#create'
  delete '/logout', to: 'session#destroy'
  get '/dashboard', to: 'users#show'
  resources :users, only: [:new, :index, :create]
  resources :items, only: [:index]
  resources :categories, only: [:index]
  get '/categories/:slug', to: 'categories#show', as: "category"
  resources :cart_items, only: [:create, :show, :update, :destroy]
  get '/cart', to: 'cart_items#index'
  resources :orders, only: [:create,:show]
  get '/orders', to: 'orders#index'

end
