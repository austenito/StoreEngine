require 'spec_helper'

describe 'browsing products' do

  let!(:product){Product.create!(name: 'name', description: 'description')}

  it 'displays all products' do
    Product.any_instance.should_receive(:name).and_return('name')
    visit '/'
    page.should have_content('name')
  end

  it "displays an image"


  it "displays a description" do
    Product.any_instance.should_receive(:description).and_return('description')
    visit '/'
    page.should have_content('description')
  end

  describe "buy link" do
    it "has a buy button" do
      visit '/'
      page.should have_link('Buy!', href: '/checkout')
    end

    it "redirects to the checkout page from the buy button" do
      visit '/'
      click_link("Buy!")
      current_path.should == '/checkout'
    end
  end
end
