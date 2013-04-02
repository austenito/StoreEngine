class CheckoutsController < ApplicationController
  def show

    user = login(params[:email], params[:password])

    if user == nil 
      flash.notice = "Please log in before checking out!"
      redirect_to login_path
    else 
      @cart = Cart.find_by_id(session[:cart_id])
      render :show
    end
  end

  def create
    cart = Cart.find_by_id(session[:cart_id])

    if valid_billing_info? params
      order = Order.new(user_id: current_user.id)

      cart.products.each do |product|
        order.products << product
        order.save
        quantity = cart.cart_products.find_by_product_id(product.id).quantity
        order_product = order.order_products.find_by_product_id(product.id)
        order_product.quantity = quantity
        order_product.save
      end

      order.save
      redirect_to confirmation_checkout_path

    else
      flash.notice = "Invalid Billing Information"
      redirect_to checkout_path, {error: "check your form again"}
    end
  end

  def valid_billing_info? params
    # CreditCardValidator::Validator.valid?(params[:creditCardNumber])
    true
  end
end
