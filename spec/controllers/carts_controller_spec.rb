require 'spec_helper'

describe CartsController do

  let!(:product){Product.create!(name: 'name', description: 'description', price: 34.99)}
  let!(:product2){Product.create!(name: 'name2', description: 'description', price: 12.99)}

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

  context "adding the first item to the cart" do
    it "adds the newly created cart id to the current session" do
      post :add_item, { product_id: product.id }
      expect(session[:cart_id]).to_not be_nil
    end
  end

  context "adding another item to an existing cart" do

    it "adds to the cart" do
      post :add_item, { product_id: product.id }
      post :add_item, { product_id: product2.id }
      items = [product, product2]
      expect(Cart.find_by_id(session[:cart_id]).products).to match_array items
    end

    it "doesnt add a non exisiting item to the cart" do
      post :add_item, { product_id: product.id }
      post :add_item, { product_id: 123 }
      expect(Cart.find_by_id(session[:cart_id]).products).to match_array [product]
    end

    it "does not create a new cart" do
      post :add_item, { product_id: product.id }
      post :add_item, { product_id: product2.id }
      expect(Cart.count).to eq 1
    end
  end

  context "updates quantity" do
    it "updates the quantity for a product" do
      post :add_item, { product_id: product.id }
      cart = Cart.find_by_id(session[:cart_id])
      put :update_quantity, { product_id: product.id, quantity: 2 }
      expect(cart.cart_products.find_by_product_id(product.id).quantity).to eq 2
    end
  end
end
