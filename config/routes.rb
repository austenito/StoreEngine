StoreEngine::Application.routes.draw do


  root :to => 'products#index'

  resources :products, :only => [:show]

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
    resources :orders do 
      member do 
        post :cancel
        post :return
        post :ship
      end 
    end 
  end

  match "/create_account" => "users#new", :via => [:get]

  resources :users
  resources :user_sessions, :only => [:new, :create]

  resource :user_session, :only => [:destroy]

  match "/login" => "user_sessions#create", :via =>[:get]

end
