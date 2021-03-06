class Admin::ProductsController < Admin::AdminController

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
    @categories = Category.all
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
    params[:category_ids] ||= []

    @product = Product.find_by_id(params[:id])
    @product.update_attributes(params[:product])

    @product.categories.clear

    params[:category_ids].each do |id|
      @product.categories << Category.find_by_id(id)
    end

    redirect_to admin_products_path
  end

  def retire
    product = Product.find_by_id(params[:id])

    product.retired = true
    product.save

    redirect_to admin_products_path(product)
  end

end
