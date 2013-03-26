class CategoriesController < ApplicationController

  def new
    @category = Category.new

    respond_to do |format|
      format.html #new.html.erb
    end
  end

  def create
    @category = Category.new(params[:category])

    respond_to do |format|
      if @category.save
        format.html {redirect_to @category, notice: 'Category was successfully created.'}
      else
        format.html { render action: "new"}
      end
    end
  end

  def show
    @category = Category.find(params[:id])

    respond_to do |format|
      format.html #show.html.erb
    end
  end
end
