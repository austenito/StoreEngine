require 'spec_helper'

describe 'admin products page' do

  context 'a regular user visits the page' do
    it 'gets redirected to the homepage' do
      pending
    end
  end

  context 'an admin wants to create a product' do

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
        #todo - add image option to this page
        visit new_admin_product_path
        fill_in('product_name', with: "product_name")
        fill_in('description', with: "product_description")
        fill_in('price', with: 1.00)
        click_button("Create Product")
        expect(current_path).to eq admin_products_path
        expect(Product.count).to eq 1
      end 
    end
  end

  context 'an admin wants to modify an existing product' do 

    it "has an edit button for each product" do 
      # todo - add image option to the index page
      Product.create(name: 'name', description: 'description', price: 34.99)
      visit admin_products_path
      Product.all.each do |product|
        page.should have_button('Edit Product')
      end
    end 

    it "allows admins to edit products" do
      pending 
      Product.create!(name: 'name', description: 'description', price: 34.99)
      visit admin_products_path
      #click edit for the first product
      fill_in('description', with: 'new product description')
      expect(product.find_by_id(1).description).to eq 'new product description'
    end 
  end 
end



