class Admin::OrdersController < ActionController::Base

  def index
    if params[:status] == nil
      @orders = Order.all
    else
      @orders = Order.find_all_by_status(params[:status])
    end
  end

  def show
    @order = Order.find_by_id(params[:id])
  end 

  def update
    @order = Order.find_by_id(params[:id])
    @order.status = params[:status]
    @order.save
    redirect_to admin_orders_path
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
    @order = Order.find_by_id(params[:id])
    @order.status = "shipped"
    @order.save
    redirect_to admin_orders_path
  end  

  def edit
    @order = Order.find_by_id(params[:id])
  end 

## create order products for that order

end 

