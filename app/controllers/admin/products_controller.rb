class Admin::ProductsController < ActionController::Base

  def new
  end 

  def index
    @products = Product.all
  end 

  def create
    @product = Product.new(name: params[:product_name], description: params[:description], price: params[:price])
    if @product.save
      redirect_to admin_products_path
    else
      render action: "new"
    end 
  end 
end
