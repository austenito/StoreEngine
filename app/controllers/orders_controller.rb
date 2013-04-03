class OrdersController < ApplicationController
  before_filter :require_login


  def index
    @orders = Order.find_all_by_user_id(current_user.id)
  end

  def show
    @order = Order.find_by_id(params[:id])
  end
end
