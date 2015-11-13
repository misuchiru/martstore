class Admin::UsersController < ApplicationController
  layout "admin"

  before_action :authenticate_user!
  before_action :admin_required
  
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to admin_users_path
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to admin_users_path
    else
      render :edit
    end
  end

  def to_admin
    @user = User.find(params[:user_id])
    @user.to_admin

    redirect_to admin_users_path
  end

  def to_normal
    @user = User.find(params[:user_id])
    @user.to_normal

    redirect_to admin_users_path
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :is_admin)
  end
end
