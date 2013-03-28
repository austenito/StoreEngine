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

    it "shows total number of orders by status" do 
      Product.create(name: "banana", description: "yummy", price: 2.00)
      order = Order.create(product_id: 1, quantity: 2, status: "shipped")
      get :index
      expect(Order.find_all_by_status("shipped").count).to eq 1 
    end 

    it "cancells an order that is currently pending" do 
      pending
      Product.create(name: "banana", description: "yummy", price: 2.00)
      order = Order.create(product_id: 1, quantity: 2, status: "shipped")
    end 

    it "returns the products associated with an order" do
      new_product = Product.create(name: "banana", description: "yummy", price: 2.00)
      order = Order.create(product_id: 1, quantity: 2, status: "shipped")
      order.products << new_product
      get :show, {id: 1}
      expect(assigns(:order).products.first.name).to eq new_product.name
    end 
  end 

  context "an admin clicks to view an individual order" do 

    it "takes them to that orders page" do 
      new_product = Product.create(name: "banana", description: "yummy", price: 2.00)
      order = Order.create(product_id: 1, quantity: 2, status: "shipped")
      order.products << new_product
      get :show, {id: 1}
    end 

    it "returns the correct information" do 
    end 
  end 

  context "an admin clicks to update an order" do 
    it "takes them to the edit orders page" do 
    end 

    it "edits that order when they click submit" do 
    end 
  end 
end 
