require 'spec_helper'

describe 'admin products page' do
  context 'a regular user visits the page' do
    it 'gets redirected to the homepage' do
      pending
    end
  end

  context 'is visited by an admin' do

    it "takes you to a create page when create product button is clicked" do 
      visit admin_products_path
      click_button("Create Product")
      expect(current_path).to eq new_admin_product_path
    end 

    context 'there are existing products' do

      it "sends a message that the product already exists" do 
        pending 
      end 
    end

    context 'there are no products' do

      it "creates a new product" do 
        visit '/admin/products/new'
        fill_in('product_name', with: "product_name")
        fill_in('description', with: "product_description")
        fill_in('price', with: 1.00)
        click_button("Create Product")
        expect(current_path).to eq admin_products_path
        expect(Product.count).to eq 1
      end 
    end
  end
end
