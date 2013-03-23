require 'spec_helper'

describe "checkout process" do

  let!(:product){Product.create!(name: "cool beans", description: "very cold beans", price: 2)}

  it "has a table of our current cart"  do
    visit '/checkout'
    within(:xpath, '//table') do
      find(:xpath, '//tr/td[position()=1]').should have_content(product.name)
      find(:xpath, '//tr/td[position()=2]').should have_content('1')
      find(:xpath, '//tr/td[position()=3]').should have_content(product.price)
      quantity = 1
      find(:xpath, '//tr/td[position()=4]').should have_content(quantity*product.price)
    end
  end

  it "has a form for user information" do
    visit '/checkout'
    page.should have_field("firstName")
    page.should have_field("lastName")
    page.should have_field("creditCardNumber")
    page.should have_field("expirationDate")
    page.should have_field("addressLine1")
    page.should have_field("addressLine2")
    page.should have_field("city")
    page.should have_field("state")
    page.should have_field("zipcode")
    page.should have_field("email")
  end

  it "has a cancel button" do
    visit '/checkout'
    click_link("Cancel")
    current_path.should == '/'
  end

  context "billing information" do

    context "valid billing info" do
      it "goes to the confirmation page" do
        visit '/checkout'
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

        current_path.should eq '/checkout_confirmation'

      end
    end
  end

end


