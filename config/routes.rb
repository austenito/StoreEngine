StoreEngine::Application.routes.draw do
  root :to => 'products#index'

  resource :checkout, :only => [:show] do 
    get :confirmation 
    post :confirmation 
  end

  resource :cart, :only => [:show] do 
    post :add_item
    put :update_quantity
  end 

 
end
