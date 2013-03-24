require 'spec_helper'

describe 'browsing products' do

  let!(:product){Product.create!(name: 'name', description: 'description')}
  let!(:product2){Product.create!(name: 'name2', description: 'description')}

  it 'displays all products' do
    Product.any_instance.should_receive(:name).and_return('name')
    visit '/'
    page.should have_content('name')
    page.should have_content('name2')
  end

  it "displays an image"


  it "displays a description" do
    Product.any_instance.should_receive(:description).and_return('description')
    visit '/'
    page.should have_content('description')
  end

  describe "buy link" do
    it "has a buy button for each product" do
      pending "Need to add buy for each item and add to a cart"
      visit '/'

      page.should have_link('Buy!', href: '/checkout')
    end

    it "user can click buy for multiple items" do 
      pending
    end

    it "redirects to the checkout page from the buy button" do
      pending
      visit '/'
      click_link("Buy!")
      current_path.should == '/checkout'
    end
  end
end
