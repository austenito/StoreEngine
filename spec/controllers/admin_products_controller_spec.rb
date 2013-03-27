require 'spec_helper'

describe Admin::ProductsController do
  context 'when a new produt button gets clicked by an admin' do
    it 'creates the new product' do
      post :create, {product_name: 'goat', description: 'has beard', price: 1.99}
      expect(Product.last.name).to eq 'goat'
    end
  end

  context 'when an edit product button gets submitted by an admin' do 

    it "edits that product" do 
      Product.create!(name: 'name', description: 'description', price: 34.99)
      post :update, { id: 1, product: { name: 'name', description: 'new product description', price: 34.99 } }
      expect(Product.find_by_id(1).description).to eq 'new product description'
    end 
  end 
end

