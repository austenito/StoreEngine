require 'spec_helper'

describe "user cart" do 

  let!(:product){Product.create!(name: "cool beans", description: "very cold beans", price: 2)}

  context "when a user visits their cart and they don't have items" do 

    it "displays their cart page" do 
      visit '/my_cart'
      expect(page).to have_content('Your cart is empty')
    end

  end 

  context "when a user visits their cart and they have items" do 

    it "displays their selected products" do 
      pending
      visit '/my_cart'
      expect(page).to have_content(product)
    end 


  end 
end 