class OrdersController < ApplicationController
  before_filter :check_authentication

  def check_authentication
    if !current_user
      redirect_to new_user_session_path
    else
    end
  end
  
  def index
    @orders = Order.find_all_by_user_id(current_user.id)
  end

  def show
    @order = Order.find_by_id(params[:id])
  end
end
