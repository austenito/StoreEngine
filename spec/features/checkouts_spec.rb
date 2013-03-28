require 'spec_helper'

describe "checkout process" do

  let!(:product){Product.create!(name: "cool beans", description: "very cold beans", price: 2)}

  it "has a table of our current cart"  do
    pending "need to login and create a cart"
    visit root_path
    click_button(product.id)

    visit checkout_path
    within(:xpath, '//table') do
      pending "need to fix form"
      find(:xpath, '//tr/td[position()=1]').should have_content(product.name)
      find(:xpath, '//tr/td[position()=2]/input').should have_content('1')
      find(:xpath, '//tr/td[position()=3]').should have_content(product.price)
      quantity = 1
      find(:xpath, '//tr/td[position()=4]').should have_content(quantity*product.price)
    end
  end

  it "has a cancel button" do
    pending "need to login and create a cart"
    visit root_path
    click_button(product.id)

    visit checkout_path
    click_link("Cancel")
    current_path.should eq '/'
  end

  context "when a user clicks checkout" do

    context "and entered valid billing info" do

      it "then the user is sent to the confirmation page" do
        pending "need to login and create a cart"
        visit root_path
        click_button(product.id)

        visit checkout_path
        fill_in('firstName', with: "Bob")
        fill_in('lastName', with: "Smith")
        fill_in('creditCardNumber', with: 4916618311549608)
        fill_in('expirationDate', with: "05/12")
        fill_in('addressLine1', with: "1062 Delaware Street")
        fill_in('addressLine2', with: "")
        fill_in('city', with: "Denver")
        fill_in('state', with: "CO")
        fill_in('zipcode', with: "80204")
        fill_in('email', with: "bob_smith@gmail.com")

        click_button("Checkout")
        current_path.should eq confirmation_checkout_path
        expect(Order.count).to eq 1
      end
    end
  end
end


