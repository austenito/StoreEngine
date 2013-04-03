StoreEngine::Application.routes.draw do

  resources :user_sessions

  root :to => 'products#index'

  resources :products, :only => [:show]

  resource :checkout, :only => [:create, :show] do
    get :confirmation
    post :two_click
  end

  resource :cart, :only => [:show] do
    post :add_item
    post :update_quantity
    post :delete_product
  end


  resources :orders

  namespace :admin do

    resources :products do
      member do
        post :retire
      end
    end

    resources :orders do
      member do
        post :cancel
        post :return
        post :ship
        post :update_quantity
      end
    end

    resources :categories
  end

  resources :categories
  
  resource :order

  resources :users
  
  match "/create_account" => "users#new", :via => [:get]

  resources :user_sessions

  resource :user_session, :only => [:destroy]

  match "/login" => "user_sessions#create", :via =>[:get]

  match "/logout" => "user_sessions#destroy", :via =>[:post]

  match "/about" => "abouts#index", :via => [:get]
end
