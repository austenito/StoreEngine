class ProductsController < ApplicationController

  def index

    # WTF what if you a category that does exist  
    if params[:filter_by_category] && category = Category.find_by_name(params[:filter_by_category])
      products = Product.includes(:categories).where(categories: {name: params[:filter_by_category]})
      @products = products.collect { |product| product if product.retired == false }
      #@products Category.find_by_name(params[:filter_by_category]).products.where('retired = false')
    else
      @products = Product.find_all_by_retired(false)
    end
  end

  def show
    @product = Product.find(params[:id])
  end
end

