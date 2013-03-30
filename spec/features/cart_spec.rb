require 'spec_helper'

describe "user cart" do

  let!(:product){Product.create!(name: "cool beans", description: "very cold beans", price: 2)}
  let!(:product2){Product.create!(name: "warm beans", description: "very hot beans", price: 2.50)}

  context "when a user visits their cart and they don't have items" do

    it "displays their cart page" do
       visit cart_path
       expect(page).to have_content('empty')
    end

  end

  context "when a user visits their cart and they have items" do
    let(:select_products) do
      visit root_path
      click_button(product.id)
      click_button(product2.id)
    end

    it "has a table of their current cart"  do
      pending 
      #select_products is broken 
      select_products
      visit cart_path

      within(:xpath, '//table') do
        find(:xpath, '//tr[position()=1]/td[position()=1]').should have_content(product.name)
        find(:xpath, '//tr[position()=1]/td[position()=3]').should have_content(product.price)
        quantity = 1
        find(:xpath, '//tr[position()=1]/td[position()=4]').should have_content(quantity*product.price)

        find(:xpath, '//tr[position()=2]/td[position()=1]').should have_content(product2.name)
        find(:xpath, '//tr[position()=2]/td[position()=3]').should have_content(product2.price)
        quantity = 1
        find(:xpath, '//tr[position()=2]/td[position()=4]').should have_content(quantity*product2.price)
      end
    end

    context "and the user clicks 'checkout'" do

      context "and the user is not logged in" do
        it "redirects to a signup and login page" do
          pending
          #need to fix id for buy button on index page 
          select_products 
          visit cart_path

          click_button('checkout')

          expect(current_path).to eq new_user_session_path
        end

      end

      context "and the user is logged in" do
        it "goes to the checkout page" do
          pending 
          #select_products is broken 
          user = User.create!(email: 'blah@blah.com', password: '1234', password_confirmation: '1234')
          visit login_path
          fill_in('email', with: "blah@blah.com")
          fill_in('password', with: "1234")
          click_button("Log in!")

          select_products
          visit cart_path

          click_button('checkout')

          expect(current_path).to eq checkout_path

        end
      end
    end
  end

end