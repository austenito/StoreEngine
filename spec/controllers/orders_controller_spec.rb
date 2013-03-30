require 'spec_helper'

describe OrdersController do
  context 'GET#index' do
    it 'populates an array with users orders' do
      user = User.create(email: 'd@d.com', password: '1234', password_confirmation: '1234')
      login_user(user)
      orders = []
      orders << Order.create(user_id: 1)
      orders << Order.create(user_id: 1)
      Order.create(user_id: 2)
      get :index
      expect(assigns(:orders)).to match_array orders

    end

    it "does not create duplicate order products for a single product" do 
      product = Product.create!(name: 'name', description: 'description', price: 34.99)
      cart = Cart.create
      expect(order.order_products.count).to eq 1
      expect(order.order_products.first.quantity).to eq 2
    end 
  end

end
