require 'spec_helper'

describe 'admin products page' do
  context 'a regular user visits the page' do
    it 'gets redirected to the homepage' do
      pending
    end
  end

  context 'is visited by an admin' do

    it "takes you to a create page when create_product button is clicked" do 
      pending
      visit '/admin/products'
      click_button("Create Product")
      expect(current_path).to eq new_admin_product_path
    end 

    it "creates a new product" do 
      pending
      visit '/admin/products/new'
      fill_in('productName', with: "product_name")
      fill_in('description', with: "product_description")
      fill_in('price', with: 1.00)
    end 

    context 'there are existing products' do
    end

    context 'there are no products' do
    end
  end
end
