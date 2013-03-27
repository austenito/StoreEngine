class UserSessionsController < ApplicationController
  def new
  end

  def create
    user = login(params[:email], params[:password])

    if user
      redirect_back_or_to root_path, notice: "LOGGED IN!"
    else
      render :login_form
    end
  end
end
