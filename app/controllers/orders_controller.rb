class OrdersController < ApplicationController

  def index
    @orders = Order.find_all_by_user_id(current_user.id)
  end

  def new

  end
end
