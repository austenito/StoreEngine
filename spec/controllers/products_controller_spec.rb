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

end
