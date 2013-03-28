StoreEngine::Application.routes.draw do

  resources :user_sessions, :only => [:new, :create]

  root :to => 'products#index'

  resource :checkout, :only => [:create, :show] do
    get :confirmation
  end

  resource :cart, :only => [:show] do
    post :add_item
    put :update_quantity
  end

  resources :orders

  namespace :admin do
    resources :products
    resources :orders
  end 

  resource :order

  match "/create_account" => "users#new", :via => [:get]
  resources :users

  match "/login" => "user_sessions#create", :via =>[:get]
  #match "/dashboard" => "user_sessions#create", :via =>[:get]

end
