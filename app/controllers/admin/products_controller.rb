class Admin::ProductsController < ActionController::Base

  def new
    @product = Product.new
  end

  def show
    @product = Product.find_by_id(params[:id])
  end

  def index
    @products = Product.all
  end

  def edit
    @product = Product.find_by_id(params[:id])
  end

  def create
    @product = Product.new(params[:product])
    if @product.save
      redirect_to admin_products_path
    else
      render action: "new"
    end
  end

  def update
    @product = Product.find_by_id(params[:id])
    @product.update_attributes(params[:product])
    redirect_to admin_products_path
  end

  def retire
    product = Product.find_by_id(params[:id])

    product.retired = true
    product.save

    redirect_to admin_products_path(product)
  end
end
