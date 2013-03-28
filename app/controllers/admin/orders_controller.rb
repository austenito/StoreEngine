class Admin::OrdersController < ActionController::Base

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find_by_id(params[:id])
  end 

## create order products for that order

end 