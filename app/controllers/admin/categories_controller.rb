<<<<<<< HEAD
class Admin::CategoriesController < ActionController::Base
=======
class Admin::CategoriesController < ApplicationController
>>>>>>> fb6dad55a196bca1b4aa0c3be5d34c6a80439387

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
