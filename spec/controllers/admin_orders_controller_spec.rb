require 'spec_helper'

describe Admin::OrdersController do

  context "an admin visits their order page" do 

    it "renders all orders" do 
      Product.create(name: "banana", description: "yummy", price: 2.00)
      order = Order.create(product_id: 1, quantity: 2)
      orders = Order.all
      get :index
      expect(assigns(:orders)).to match_array orders
    end 
  end 
end 
