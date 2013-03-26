require 'spec_helper'

describe 'browsing products' do

  let!(:product){Product.create!(name: 'name', description: 'description', price: 34.99)}
  let!(:product2){Product.create!(name: 'name2', description: 'description', price: 12.99)}

  it 'displays all products' do
    visit root_path
    page.should have_content('name')
    page.should have_content('name2')
  end

  it "displays an image"

  it "displays a description" do
    visit root_path
    page.should have_content(product.description)
    page.should have_content(product2.description)
  end

  describe "buy link" do
    it "has a buy button for each product" do
      visit root_path
        Product.all.each do |product|
        page.should have_button('Buy!')
      end
    end

    it "user can click buy and the items will be aded to their cart" do
      visit root_path
      Product.all.each do |product|
        # click_button("Buy!")
      end

      pending "create shopping cart controller and model before finishing this test"

    end

    it "redirects to the checkout page from the buy button" do
      pending
      visit root_path
      click_link("Buy!")
      current_path.should == '/checkout'
    end
  end
end
