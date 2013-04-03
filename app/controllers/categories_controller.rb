class CategoriesController < ApplicationController

  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])

    if @category
      products = Product.includes(:categories).where(categories: {name: params[:filter_by_category]})
      @products = products.collect { |product| product if product.retired == false }
    end
  end
end
