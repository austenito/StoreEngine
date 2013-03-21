require 'spec_helper'

describe 'browsing products' do

  let(:product){Product.create!(name: 'name', description: 'description')}
  it 'displays all products' do 
    product
    visit '/'
    page.should have_content('Amazing eBook')
  end

  it "displays an image"


  it "displays a description" do
    product
    visit '/'
    page.should have_content('somedescription')
  end

  it "has a buy button" do
    visit '/'
    page.should have_link('Buy!', href: '/checkout')
  end
end
