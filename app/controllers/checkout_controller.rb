class CheckoutController < ApplicationController

  def view
    @product = Product.first
  end

  def confirm
    unless CreditCardValidator::Validator.valid?(params[:creditCardNumber])
      redirect_to '/checkout'
    else
      product = Product.find_by_id(params[:product_id])
      Order.create(product: product, quantity: params[:quantity])
    end
  end
end
