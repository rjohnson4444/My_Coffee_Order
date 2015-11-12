Rails.application.routes.draw do
  get '/', to: 'home#index'
  get '/login', to: 'session#new'
  post '/login', to: 'session#create'
  delete '/logout', to: 'session#destroy'
  resources :users, only: [:new, :index, :create, :show]
  resources :items, only: [:index]
  resources :categories, only: [:show]
  resources :cart_items, only: [:create, :show, :index, :update,:destroy]
end
