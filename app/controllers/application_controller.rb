class ApplicationController < ActionController::Base
  protect_from_forgery

  def require_login
    if !current_user
      flash.notice = "Please log in before checking out!"
      redirect_to login_path
    end
  end

  def current_cart
    Cart.find_by_id(session[:cart_id])
  end
end
