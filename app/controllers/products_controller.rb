class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def update
    @product = Product.find_by_id(params[:id])
    puts params[:category].inspect

    params[:category].values.each do |category_id|
      category = Category.find_by_id(category_id)
      @product.categories << category
    end
    redirect_to product_path(@product)
  end
end
