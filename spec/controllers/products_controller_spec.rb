require 'spec_helper'

describe ProductsController do

  describe 'GET #index' do
    it "assigns product to a product" do
      Product.create!(name: "sample", description: "thing", price: 13.99)
      Product.create!(name: "sample", description: "thing2", price: 13.99, retired: true)
      products = Product.find_all_by_retired(false)
      get :index
      expect(assigns(:products)).to match_array products
    end
  end
end
