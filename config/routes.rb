StoreEngine::Application.routes.draw do
  resources :categories


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
    resources :categories
  end

  resource :order

  resources :products
end
