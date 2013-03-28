class CheckoutsController < ApplicationController
  def show
    @cart = Cart.find_by_id(session[:cart_id])
    if can? :checkout, @cart
      render :show
    else
      redirect_to new_user_session_path
    end

  end

  def create

    cart = Cart.find_by_id(session[:cart_id])
    if can? :checkout, cart
      if valid_billing_info? params
        order = Order.create

        cart.products.each do |product |
          order.products << product
        end

        order.save
        redirect_to confirmation_checkout_path

      else
        redirect_to checkout_path, {error: "check your form again"}
      end

    else
      redirect_to new_user_session_path

    end

  end

  def valid_billing_info? params
    CreditCardValidator::Validator.valid?(params[:creditCardNumber])
  end
end
