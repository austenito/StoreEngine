class CheckoutController < ApplicationController

  def view
  end

  def confirm
    Order.create(product_id: 1, quantity: params[:quantity])
  end

end
