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
        redirect_to root_path, notice: "LOGGED IN!"
      end
    else
      render :login_form
    end
  end

  def destroy
    session.clear
    redirect_to root_path, :notice => "Come back soon!"
  end
end
