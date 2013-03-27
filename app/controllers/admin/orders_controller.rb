class Admin::OrdersController < ActionController::Base

  def index
    @orders = Order.all
  end



end 