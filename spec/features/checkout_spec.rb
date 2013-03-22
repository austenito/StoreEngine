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

  context "buy button" do

    it "has a buy button" do
      visit '/checkout'
      page.should have_link("Checkout", href: '/checkout_confirmation')
    end

    it "redirects to the confirmation page" do
      visit '/checkout'
      click_link("Checkout")
      current_path.should == '/checkout_confirmation'
    end
  end

  it "has a cancel button" do
    visit '/checkout'
    click_link("Cancel")
    current_path.should == '/'
  end

end


