class CheckoutsController < ApplicationController
  before_filter :require_login

  def show
    @cart = current_cart
    render :show
  end

  def create
    checkout = Checkout.new(billing_info(params))

    if checkout.valid?
      order = Order.new(user_id: current_user.id)

      current_cart.products.each do |product|
        order.products << product
        order.save
        order.order_products.each { |order_product| order_product.save }
        quantity = current_cart.cart_products.find_by_product_id(product.id).quantity
        order_product = order.order_products.find_by_product_id(product.id)
        order_product.quantity = quantity
        order_product.save!
      end

      order.save!
      CheckoutsMailer.order_fulfillment(@user).deliver
      redirect_to confirmation_checkout_path

    else
      flash.notice = "Invalid Billing Information"
      redirect_to checkout_path, {error: "check your form again"}
    end
  end

  def confirmation
    @order = Order.last
  end

  def billing_info params
    billing_info = {
      credit_card_number: params[:creditCardNumber],
      address_line1: params[:addressLine1],
      address_line2: params[:addressLine2],
      city: params[:city],
      state: params[:state],
      zipcode: params[:zipcode],
      name: "#{params[:firstName]} #{params[:lastName]}"
    }
  end
end
