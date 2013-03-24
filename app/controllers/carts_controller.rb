class CartsController < ApplicationController

  def add_item
     product = Product.find(params[:product_id])
    Cart.create.products << product
    redirect_to root_path, flash: { success: "Product added to cart" }
  end

  def show
  end
end
