require 'spec_helper'

describe OrdersController do
  context 'GET#index' do
    it 'populates an array with users orders' do
      user = User.create!(first_name: "afirstname", last_name: "alastname", email: "email@email.com", password:"1234", password_confirmation:"1234")
      product = Product.create!(name: "sample", description: "thing", price: 13.99)
      login_user(user)
      orders = []
      order = Order.new(user_id: 1)
      order.products << product
      order.save
      order2 = Order.create(user_id: 1)
      order2.products << product
      order2.save
      orders << order
      orders << order2
      get :index
      expect(assigns(:orders)).to match_array orders

    end
  end
end
