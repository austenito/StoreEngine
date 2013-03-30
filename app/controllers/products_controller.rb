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

  def update
    @product = Product.find_by_id(params[:id])

    params[:category].values.each do |category_id|
      category = Category.find_by_id(category_id)
      @product.categories << category
    end
    redirect_to product_path(@product)
  end
end

