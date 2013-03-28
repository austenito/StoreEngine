require 'spec_helper'

describe ProductsController do

  describe 'GET #index' do
    it "assigns product to a product" do
      product = Product.create!(name: "sample", description: "thing", price: 13.99)

      products = [product]

      get :index
      expect(assigns(:products)).to match_array products

    end
  end

  describe 'Associating categories with a product' do
    context 'when modifying existing product' do
      it 'adds category to product' do
        category = Category.create!(name: "shoes")
        product = Product.create!(name: "Nike high-tops", description: "black and gold", price: 99.99)

        expect{
          put :update, :id => product.id, :category => {shoes: category.id}
        }.to change(product.categories, :count).by(1)
      end
    end
  end
end
