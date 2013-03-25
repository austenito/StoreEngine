class CheckoutsController < ApplicationController

  def show
    @product = Product.first
  end

  def confirmation
    unless CreditCardValidator::Validator.valid?(params[:creditCardNumber])
      redirect_to checkout_path
    else
      product = Product.find_by_id(params[:product_id])
      Order.create(product: product, quantity: params[:quantity])
    end
  end
end
