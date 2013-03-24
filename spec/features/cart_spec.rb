require 'spec_helper'

describe "user cart" do 

  let!(:product){Product.create!(name: "cool beans", description: "very cold beans", price: 2)}
  let!(:product2){Product.create!(name: "warm beans", description: "very hot beans", price: 2.50)}

  context "when a user visits their cart and they don't have items" do 

    it "displays their cart page" do 
      pending
      
      visit '/my_cart'
      expect(page).to have_content('Your cart is empty')
    end

  end 

  context "when a user visits their cart and they have items" do 

    it "has a table of our current cart"  do
      visit '/'
      click_button(product.id)
      click_button(product2.id)

      visit '/my_cart'
      within(:xpath, '//table') do
        find(:xpath, '//tr[position()=1]/td[position()=1]').should have_content(product.name)
        find(:xpath, '//tr[position()=1]/td[position()=2]').should have_content('1')
        find(:xpath, '//tr[position()=1]/td[position()=3]').should have_content(product.price)
        quantity = 1
        find(:xpath, '//tr[position()=1]/td[position()=4]').should have_content(quantity*product.price)

        find(:xpath, '//tr[position()=2]/td[position()=1]').should have_content(product2.name)
        find(:xpath, '//tr[position()=2]/td[position()=2]').should have_content('1')
        find(:xpath, '//tr[position()=2]/td[position()=3]').should have_content(product2.price)
        quantity = 1
        find(:xpath, '//tr[position()=2]/td[position()=4]').should have_content(quantity*product2.price)
      end
  end


  end 
end 