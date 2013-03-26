class CheckoutsController < ApplicationController

  def show
    @cart = Cart.find_by_id(session[:cart_id])
  end

  def create
    unless CreditCardValidator::Validator.valid?(params[:creditCardNumber])
      redirect_to checkout_path
    else
      product = Product.find_by_id(params[:product_id])
      #Order.create(product: product, quantity: params[:quantity])
      order = Order.create
      order.products << product
      order.save
      redirect_to confirmation_checkout_path

    end

  end
end
