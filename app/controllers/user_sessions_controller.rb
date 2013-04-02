class UserSessionsController < ApplicationController
  def new
    render :login_form
  end

  def create
    user = login(params[:email], params[:password])

    if user
      if user.admin?
        redirect_to '/dashboard'
      else
        session[:current_user_id] = user.id
        redirect_to root_path, notice: "LOGGED IN!"
      end
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
