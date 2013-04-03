class CheckoutsController < ApplicationController
 
  def show

    if session[:current_user_id].nil?
      redirect_to login_path
      flash.notice = "Please log in before checking out!"
    else
      @cart = Cart.find_by_id(session[:cart_id])
      render :show
    end
  end

  def cart 
    Cart.find_by_id(session[:cart_id])
  end 

  def create
    @order = Order.new(user_id: session[:current_user_id])

    if cart != nil 

      if User.billing_info? 
        cart_checkout()
      else
        flash.notice = "Invalid Billing Information"
        redirect_to checkout_path, {error: "check your form again"}
      end

    else
      @order = two_click @order, params
    end

    if @order.save
      session[:cart_id] = nil
      redirect_to confirmation_checkout_path
      flash.notice = "Order Successful"
    else
      flash.notice = "Could not create order"
      redirect_to root_path
    end
  end

  def cart_checkout

    cart.products.each do |product|
      @order.products << product
      @order.save
      @order.order_products.each { |order_product| order_product.save }
      quantity = cart.cart_products.find_by_product_id(product.id).quantity
      order_product = @order.order_products.find_by_product_id(product.id)
      order_product.quantity = quantity
      order_product.save
    end
  end 

  def two_click order, params
    product = Product.find_by_id(params[:product_id])
    order.products << product
    order.order_products.first.quantity = 1
    order.order_products.first.save 
    order.save
    return order

  end 

  def confirmation
    @order = Order.last
  end 

  def valid_billing_info? params
    # CreditCardValidator::Validator.valid?(params[:creditCardNumber])
    true
  end
end
