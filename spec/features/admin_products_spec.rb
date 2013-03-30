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
      click_link("Add a product")
      expect(current_path).to eq new_admin_product_path
    end

    context 'there are existing products' do

      it "sends a message that the product already exists" do
        pending
      end
    end

    context 'there are no products' do

      it "creates a new product" do
        visit new_admin_product_path
        fill_in('Name', with: "product_name")
        fill_in('Description', with: "product_description")
        fill_in('Price', with: 1.00)
        click_button("Add Product")
        expect(current_path).to eq admin_products_path
        expect(Product.count).to eq 1
      end
    end
  end

  context 'an admin wants to modify an existing product' do

    it "has an edit button for each product" do
      Product.create(name: 'name', description: 'description', price: 34.99)
      visit admin_products_path
      Product.all.each do |product|
        page.should have_link('Edit')
      end
    end

    it "allows admins go to an edit page for that product" do
      Product.create!(name: 'name', description: 'description', price: 34.99)
      visit admin_products_path
      click_link("Edit")
      expect(current_path).to eq '/admin/products/1'
    end
  end
end



