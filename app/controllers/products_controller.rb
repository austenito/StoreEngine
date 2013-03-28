class ProductsController < ApplicationController
  def index
    @products = Product.find_all_by_retired(false)
  end
end
