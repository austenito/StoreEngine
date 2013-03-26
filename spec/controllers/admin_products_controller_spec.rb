require 'spec_helper'

describe Admin::ProductsController do
  context 'when a new produt buttonn gets clicked by an admin' do
    it 'creates the new product' do
      post :create, {product_name: 'goat', description: 'has beard', price: 1.99}
      expect(Product.count).to eq 1
    end
  end
end
