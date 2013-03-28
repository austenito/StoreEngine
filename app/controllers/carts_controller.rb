class CartsController < ApplicationController

  def add_item
    session[:cart_id] ||= Cart.create.id
    cart = Cart.find_by_id(session[:cart_id])
    product = Product.find(params[:product_id])
    cart.products << product
    flash[:success] = "Product added to cart"
    redirect_to root_path
  end

  def show
    @cart = Cart.find_by_id(session[:cart_id])
  end

  def update_quantity
    cart = Cart.find_by_id(session[:cart_id])
    cart_product = cart.cart_products.find_by_product_id(params[:product_id])
    cart_product.quantity = params[:quantity]
    cart_product.save
  end
end

