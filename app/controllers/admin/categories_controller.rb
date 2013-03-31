class Admin::CategoriesController < ActionController::Base

  #show/cat index

  def index
    @categories = Category.all
  end 

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(params[:category])
    if @category.save
      redirect_to admin_categories_path
    else
      render action: "new"
    end
  end
end
