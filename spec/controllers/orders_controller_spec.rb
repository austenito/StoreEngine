require 'spec_helper'

describe OrdersController do

  context "a logged in user" do

    before do
      user = User.create!(
        first_name: "afirstname",
        last_name: "alastname",
        email: "email@email.com",
        password:"1234",
        password_confirmation:"1234")

      login_user(user)
    end

    context 'GET#index' do
      it 'populates an array with users orders' do
        product = Product.create!(name: "sample", description: "thing", price: 13.99)
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

  context "A user that's not logged in" do
    it "doesn't let a user see orders" do
      get :index
      expect(response).to redirect_to login_path
    end
  end
end
