require 'spec_helper'

describe ProductsController do

  describe 'GET #index' do
    it "assigns @product to an array of all products" do
      product = Product.create!(name: "sample", description: "thing", price: 13.99)
      products = Product.all
      get :index
      expect(assigns(:products)).to match_array products
    end
  end

  describe 'filter products by category' do
    context 'when an unauth user wants to browse products by category' do
      it 'assigns @product to an array of products with the category "shoes"' do
        category = Category.create!(name: "shoes")
        product1 = Product.create!(name: "Nike", description: "sneakers", price: 13.99)
        product2 = Product.create!(name: "Addidas", description: "pants", price: 13.99)
        product1.categories << category
        get :index, {:filter_by_category => "shoes"}
        products = [product1]
        expect(assigns(:products)).to match_array products
      end
    end
  end
end
