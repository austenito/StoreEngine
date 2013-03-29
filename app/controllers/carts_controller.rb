class CartsController < ApplicationController

  #do line 6 as a before filter # ensure there is a cart id

  def add_item
    cart_id = session[:cart_id]
    cart_id ||= Cart.create.id
    session[:cart_id] = cart_id

    cart = Cart.find_by_id(session[:cart_id])

    product = Product.find_by_id(params[:product_id])

    if product
      cart.products << product
      redirect_to root_path, flash: { success: "Product added to cart" }
    else
      redirect_to root_path, flash: { error: "An error occurred while adding the item to your cart" }
    end
  end

  def show
    @cart = Cart.find_by_id(session[:cart_id])
    if @cart
      render :show
    else
      render :empty_cart
    end
  end

  def update_quantity
    cart = Cart.find_by_id(session[:cart_id])
    cart_product = cart.cart_products.find_by_product_id(params[:product_id])
    cart_product.quantity = params[:quantity]
    cart_product.save

    redirect_to cart_path
  end
end

