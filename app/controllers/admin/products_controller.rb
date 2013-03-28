class Admin::ProductsController < ActionController::Base

  def new
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
    @product = Product.new(name: params[:product_name], description: params[:description], price: params[:price])
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
end
