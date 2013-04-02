class UserSessionsController < ApplicationController
  def new
    render :login_form
  end

  def create
    user = login(params[:email], params[:password])

    if user && user.admin?
      # TODO: change to route helper method: dashboard_path
      redirect_to "/dashboard"
    elsif user
      session[:current_user_id] = user.id
      redirect_to root_path, notice: "LOGGED IN!"
    else
      render :login_form
    end
  end

  def destroy
    session[:current_user_id] = nil
    logout
    redirect_to root_path, :notice => "Logged out!"
  end
end
