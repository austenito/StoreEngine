class CategoriesController < ApplicationController

  #show/cat index

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(name: params[:name])
    if @category.save
      redirect_to admin_categories_path
    else
      render action: "new"
    end
  end

  def update
    @category = Category.find_by_id(params[:id])
    @category.update_attributes(params[:category])
    redirect_to admin_category_path
  end

end
