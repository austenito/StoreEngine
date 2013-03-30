class CategoriesController < ActionController


  def show
    @category = Category.find(params[:id])

    respond_to do |format|
      format.html #show.html.erb
    end
  end
end
