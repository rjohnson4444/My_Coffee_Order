Rails.application.routes.draw do
  root to: 'home#index'
  get '/login', to: 'session#new'
  post '/login', to: 'session#create'
  delete '/logout', to: 'session#destroy'
  get '/dashboard', to: 'users#show'
  resources :users, only: [:new, :index, :create]
  resources :items, only: [:index, :show]
  resources :categories, only: [:index]
  get '/categories/:slug', to: 'categories#show', as: "category"
  resources :cart_items, only: [:create, :show, :update, :destroy]
  get '/cart', to: 'cart_items#index'
  get '/orders', to: 'orders#index'
  resources :orders, only: [:create,:show]
  namespace :admin do
    resources :dashboard, only: [:index]
    resources :items, only: [:index, :update]
  end
end
