class CheckoutsController < ApplicationController
  def show
    @cart = Cart.find_by_id(session[:cart_id])
    render :show

  end

  def create

    cart = Cart.find_by_id(session[:cart_id])
    if valid_billing_info? params
      order = Order.create(user_id: current_user.id)

      cart.products.each do |product|
        order.products << product
        quantity = cart.cart_products.find_by_product_id(product.id).quantity
        order_product = order.order_products.find_by_product_id(product.id)
        order_product.quantity = quantity
        order_product.save
      end

      order.save
      redirect_to confirmation_checkout_path

    else
      redirect_to checkout_path, {error: "check your form again"}
    end

  end

  def valid_billing_info? params
    CreditCardValidator::Validator.valid?(params[:creditCardNumber])
  end
end
