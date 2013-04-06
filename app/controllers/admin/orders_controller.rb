class Admin::OrdersController < Admin::AdminController
  before_filter :order, only: [:show, :update_quantity]

  def index
    if params[:status] == nil
      @orders = Order.all
    else
      @orders = Order.find_all_by_status(params[:status])
    end
  end

  def show
  end

  def update_quantity
    order_product = order.order_products.find(params[:order_product_id])
    order_product.update_attributes(quantity: params[:quantity])
    redirect_to admin_orders_path
  end

  def order
    @order ||= Order.find(params[:id])
  end

  def cancel
    @order = Order.find_by_id(params[:id])
    @order.status = "cancelled"
    @order.save
    redirect_to admin_orders_path
  end

  def return
    @order = Order.find_by_id(params[:id])
    @order.status = "returned"
    @order.save
    redirect_to admin_orders_path
  end

  def ship
    order.ship
    redirect_to admin_orders_path

  end

  def edit
    @order = Order.find_by_id(params[:id])
  end

  def paid
    @order = Order.find_by_id(params[:id])
    @order.status = "paid"
    @order.save
    redirect_to admin_orders_path
  end
## create order products for that order

end

