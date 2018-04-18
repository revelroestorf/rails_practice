class AdminUsersController < ApplicationController

  before_action :check_if_admin

  def index
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.save
    redirect_to(admin_users_path)
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to(admin_users_path)
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to(admin_users_path)
  end

  def carts
    @user = User.find(params[:id])
    @carts = @user.carts
  end
  
  private

    def check_if_admin
      unless current_user.admin
        redirect_to(products_path)
        flash[:notice] = "Your account does not have administration access"
      end
    end

    def user_params
      params.require(:user).permit(:email, :admin, :active, :password)
    end
end
