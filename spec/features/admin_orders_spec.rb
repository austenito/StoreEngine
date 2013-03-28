require 'spec_helper'

describe 'admin orders dashboard page' do

  context "when an admin that is not logged in visits their dashboard page" do 
  end 

  context "when an admin that is logged in visits their dashboard page" do 

    it "shows an index of their orders" do
      visit admin_orders_path
      expect(page).to have_content('Your Orders')
    end

    it "shows all orders" do
      Product.create(name: "banana", description: "yummy", price: 2.00)
      order = Order.create(product_id: 1, quantity: 2)
      visit admin_orders_path
      expect(page).to have_content(order.id)
    end

    it "has a link to each individual order" do
      Product.create(name: "banana", description: "yummy", price: 2.00)
      order = Order.create(product_id: 1, quantity: 2)
      visit admin_orders_path
      Order.all.each do |order| 
        expect(page).to have_button("View Order")
      end
    end

    it "has a table of orders by status" do 
      Product.create(name: "banana", description: "yummy", price: 2.00)
      order = Order.create(product_id: 1, quantity: 2, status: "shipped")
      visit admin_orders_path
      expect(page).to have_content("shipped")
      expect(page).to have_content('1')
    end
  end
end 
