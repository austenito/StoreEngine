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

  context "an admin clicks to update an order" do

    it "cancels a pending order" do
      order = Order.create(product_id: 1, quantity: 2, status: "pending")
      post :cancel, { id: order.id } 
      expect(assigns(:order).status).to eq "cancelled"
    end 

    it "marks as returned orders that are currently marked as shipped" do 
      order = Order.create(product_id: 1, quantity: 2, status: "pending")
      post :return, { id: order.id }
      expect(assigns(:order).status).to eq "returned"
    end 

    it "marks as shipped orders that are currently paid" do 
      order = Order.create(product_id: 1, quantity: 2, status: "paid")
      post :ship, { id: order.id }
      expect(assigns(:order).status).to eq "shipped"
    end 
  end 

  context "an admin clicks to view orders by status" do 

    it "filters orders by shipped status" do
      order = Order.create(product_id: 1, quantity: 2, status: "shipped") 
      shipped_orders = Order.find_all_by_status("shipped")
      get :index, { status: "shipped"}
      expect(assigns(:orders)).to eq shipped_orders
    end 

    it "filters all cancelled orders" do 
      order = Order.create(product_id: 1, quantity: 2, status: "cancelled") 
      other_order = Order.create(product_id: 1, quantity: 2, status: "shipped")
      cancelled_orders = Order.find_all_by_status("cancelled")
      get :index, { status: "cancelled"}
      expect(assigns(:orders)).to eq cancelled_orders
    end 
  end 

  context "an admin clicks to edit an order" do 
    it "removes an order when 'remove' is clicked" do 
      order = Order.create(product_id: 1, quantity: 2, status: "pending")
      new_product = Product.create(name: "banana", description: "yummy", price: 2.00)
      order.products << new_product
      post :remove_product, { id: order.id, product_id: new_product.id }
      expect(order.products.include?(new_product) ).to eq false 
    end 
  end 
end 



