require 'spec_helper'

describe 'confirmation' do 

  let!(:product){Product.create!(name: "cool beans", description: "very cold beans", price: 2)}

  describe 'user receipt' do 
    it "has the user's purchase information" do
      pending
      order_1 = Order.create(product: product, quantity: 1)
      visit '/checkout_confirmation'
      page.should have_content(product.name)
      page.should have_content(product.description)
      page.should have_content(product.price * order_1.quantity)
    end 
  end 







end 