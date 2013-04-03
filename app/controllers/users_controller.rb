class UsersController < ApplicationController

  before_filter :require_login, except: [:new, :create]

  def new
    @user = User.new
  end

  def show
    @user = current_user
  end

  def create
    @user = User.new(params[:user])

    if @user.save
      redirect_to '/login', notice: "Succesfully created an account!"
    else
      render :new
    end

  end

  def edit
    @user = current_user
  end

  def update
    if current_user.update_attributes(params[:user])
      redirect_to user_path
    else
      @user = current_user
      render :edit
    end
  end

end
