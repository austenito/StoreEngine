class ProductsController < ApplicationController

  def index
    @products = Product.find_all_by_retired(false)

    if params[:filter_by_category]
      products = Product.includes(:categories).where(categories: {name: params[:filter_by_category]})
      @products = products.collect { |product| product if product.retired == false }
    end
  end

  def show
    @product = Product.find(params[:id])
  end
end

