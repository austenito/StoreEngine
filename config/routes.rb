StoreEngine::Application.routes.draw do
  root :to => 'products#index'

  resource :checkout, :only => [:create, :show] do 
    get :confirmation 
  end

  resource :cart, :only => [:show] do 
    post :add_item
  end 

  resource :order
end
