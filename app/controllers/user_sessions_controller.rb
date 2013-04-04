class UserSessionsController < ApplicationController
  def new
    render :login_form
  end

  def create
    user = login(params[:email], params[:password])

    if user && user.admin?
      # TODO: change to route helper method: dashboard_path
      redirect_to "/admin/products"
    elsif user
      redirect_to root_path
    else
      render :login_form
    end
  end

  def destroy
    logout
    #session[:current_user_id] = nil
    redirect_to root_path
  end
end
