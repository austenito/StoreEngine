class ProductsController < ApplicationController

  def index
    if params[:filter_by_category] == nil
      @products = Product.all
    else
      @products = Product.includes(:categories).where(categories: {name: params[:filter_by_category]})
    end
  end

  def update
    @product = Product.find_by_id(params[:id])

    params[:category].values.each do |category_id|
      category = Category.find_by_id(category_id)
      @product.categories << category
    end
    redirect_to product_path(@product)
  end
end
