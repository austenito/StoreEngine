class CheckoutsController < ApplicationController

  def show
    @cart = Cart.find_by_id(session[:cart_id])
  end

  def create
    unless CreditCardValidator::Validator.valid?(params[:creditCardNumber])
      redirect_to checkout_path
    else
      cart = Cart.find_by_id(session[:cart_id])
      order = Order.create

      cart.products.each do |product |
        order.products << product
      end

      order.save
      redirect_to confirmation_checkout_path

    end

  end
end
