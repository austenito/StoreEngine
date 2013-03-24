class CartsController < ApplicationController

  def add_item
    if(session[:cart_id] == nil)
      session[:cart_id] = Cart.create.id
    end
    
    cart = Cart.find_by_id(session[:cart_id])
    product = Product.find(params[:product_id])
    cart.products << product
    redirect_to root_path, flash: { success: "Product added to cart" }
  end

  def show
    @cart = Cart.find_by_id(session[:cart_id])
  end
end
