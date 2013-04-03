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
        order_product.save
      end

      if order.save
        CheckoutsMailer.order_fulfillment(@user).deliver
        session[:cart_id] = nil

        redirect_to confirmation_checkout_path
        flash.notice = "Order Successful, Please Check Your Email"
      end

    else
      redirect_to root_path, notice: flash.notice
    end
  end


  def two_click
     billing_info = {
      credit_card_number: current_user.credit_card_number,
      address_line1: current_user.address_line1,
      city: current_user.city,
      state: current_user.state,
      zipcode: current_user.zipcode,
      name: "#{current_user.first_name} #{current_user.last_name}"
    }
    checkout = Checkout.new(billing_info)

    if checkout.valid?
      order = Order.new(user_id: session[:current_user_id])

      product = Product.find_by_id(params[:product_id])
      order.products << product
      order.order_products.first.quantity = 1
      order.order_products.first.save
      order.save

      if order.save
        session[:cart_id] = nil
        redirect_to confirmation_checkout_path
        flash.notice = "Order Successful"
      end
    else
      flash.notice = "Could not create order"
      redirect_to root_path, notice: flash.notice
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
