class CartsController < ApplicationController

  #do line 6 as a before filter # ensure there is a cart id

  def add_item
    cart_id = session[:cart_id]
    cart_id ||= Cart.create.id
    session[:cart_id] = cart_id

    cart = Cart.find_by_id(session[:cart_id])

    product = Product.find_by_id(params[:product_id])

    if product
      if cart.products.include?(product)
        cart_product = cart.cart_products.find_by_product_id(product.id)
        cart_product.quantity += 1
        cart_product.save!
      else
        cart.products << product
      end
      redirect_to root_path, flash: { success: "#{product.name} was added to your cart!" }
    else
      redirect_to root_path, flash: { error: "An error occurred while adding the item to your cart" }
    end
  end
  
  def show
    @cart = Cart.find_by_id(session[:cart_id])
    if @cart && @cart.cart_products.count > 0
      render :show
    else
      render :empty_cart
    end
  end

	def delete_product
    @cart = Cart.find_by_id(session[:cart_id])
    cart_product = @cart.cart_products.find_by_product_id(params[:product_id])
    cart_product.delete

    redirect_to cart_path
	end

  def update_quantity
    @cart = Cart.find_by_id(session[:cart_id])
    cart_product = @cart.cart_products.find_by_product_id(params[:product_id])
    cart_product.quantity = params[:quantity]
    cart_product.save

    redirect_to cart_path
  end
end

