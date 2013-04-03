StoreEngine::Application.routes.draw do

  resources :indices
  match "/" => "indices#index"
  resources :user_sessions

  root :to => 'products#index'

  resources :products

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

  resources :users, :only => [:new, :create]
  resource :user, :only => [:show, :update, :edit]

  get "/create_account" => "users#new"

  resources :user_sessions

  resource :user_session, :only => [:destroy]

  get "/login" => "user_sessions#create"

  post "/logout" => "user_sessions#destroy"

  get "/about" => "abouts#index"
end
