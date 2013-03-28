StoreEngine::Application.routes.draw do

  resources :categories


  root :to => 'products#index'

<<<<<<< HEAD
<<<<<<< HEAD
  resources :products, :only => [:show]

=======
>>>>>>> add tests for updating products with categories
=======
>>>>>>> create categories controller for Admin, start tests
  resource :checkout, :only => [:create, :show] do
    get :confirmation
  end

  resource :cart, :only => [:show] do
    post :add_item
<<<<<<< HEAD
<<<<<<< HEAD
    post :update_quantity
    post :delete_product
=======
    put :update_quantity
>>>>>>> create categories controller for Admin, start tests
  end

  resources :orders

  namespace :admin do
<<<<<<< HEAD
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
=======
    put :update_quantity
>>>>>>> add tests for updating products with categories
  end

  resource :order

<<<<<<< HEAD
  match "/create_account" => "users#new", :via => [:get]

  resources :users
  resources :user_sessions, :only => [:new, :create]

  resource :user_session, :only => [:destroy]

  match "/login" => "user_sessions#create", :via =>[:get]

  #match "/dashboard" => "user_sessions#create", :via =>[:get]

=======
  resources :products
>>>>>>> add tests for updating products with categories
=======
    resources :products
    resources :categories
  end
>>>>>>> create categories controller for Admin, start tests
end
