class AdminUsersController < ApplicationController

  layout 'admin'

  before_action :confirm_logged_in

  def index
    @admin_users = AdminUser.sorted
  end

  def new
    @admin_user = AdminUser.new
  end

  def create
    @admin_user = AdminUser.new(admin_user_params)
    if @admin_user.save
      flash[:notice] = 'Successfully saved admin user'
      redirect_to(admin_users_path)
    else
      render('new')
    end
  end

  def edit
    @admin_user = AdminUser.find(params[:id])
  end

  def update
    @admin_user = AdminUser.find(params[:id])
    if @admin_user.update_attributes(admin_user_params)
      flash[:notice] = "Successfully updated admin user"
      redirect_to(admin_users_path)
    else
      render('edit')
    end
  end

  def delete
    @admin_user = AdminUser.find(params[:id])
  end

  def destroy
    @admin_user = AdminUser.find(params[:id])
    @admin_user.destroy
    flash[:notice] = "Successfully destroyed admin user #{@admin_user.name}"
    redirect_to(admin_users_path)
  end

  private

  def admin_user_params
    # permit :password, not :password_digest
    # password doesn't exist in database, it is virtual
    # hash key that is created when added 'has_secure_password'
    params.require(:admin_user).permit(:first_name,
      :last_name, :email, :username, :password)
  end

  def confirm_logged_in
    unless session[:user_id]
      flash[:notice] = "Please log in"
      redirect_to(access_login)
    end
  end


end
