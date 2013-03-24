require 'spec_helper'

describe CartsController do

  let!(:product){Product.create!(name: 'name', description: 'description')}

  context "when a buy button has been clicked for a product" do 

    it "creates a cart for the first item that is added if there is no cart" do 
      post :add_item, { product_id: product.id }
      expect(Cart.count).to eq 1 
    end 

    it "adds that item to the cart for that current user" do 
      post :add_item, { product_id: product.id }
      cart = Cart.first
      expect(cart.products.first.id).to eq product.id
    end

    it "stays on the index page" do 
      post :add_item, { product_id: product.id }
      cart = Cart.first
      expect(response).to redirect_to root_path
    end 

    it "sends the user a notification that item was added" do
      post :add_item, { product_id: product.id }
      cart = Cart.first    

      expect(flash[:success]).to_not be_nil
    end
  end

end
