class ProductsController < ApplicationController

  def index
    if params[:filter_by_category] && category = Category.find_by_name(params[:filter_by_category])
      products = Product.includes(:categories).where(categories: {name: params[:filter_by_category]})
      @products = products.collect { |product| product if product.retired == false }
    else
      @products = Product.find_all_by_retired(false)
    end
  end

  def show
    @product = Product.find(params[:id])
  end
end

