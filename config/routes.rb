StoreEngine::Application.routes.draw do


  root :to => 'products#index'

  resources :products, :only => [:show]

  resource :checkout, :only => [:create, :show] do
    get :confirmation
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
  end

  resource :order

  match "/create_account" => "users#new", :via => [:get]

  resources :users
  resources :user_sessions, :only => [:new, :create]

  resource :user_session, :only => [:destroy]

  match "/login" => "user_sessions#create", :via =>[:get]

  #match "/dashboard" => "user_sessions#create", :via =>[:get]

end
