class AccessController < ApplicationController

  layout 'admin'

  before_action :confirm_logged_in,
        except: [:login, :attempt_login, :logout]
# use except as it is 'white-listing' to any new methods will need the confirmation

  def menu
    #display text and links
  end

  def login
    #display login form
  end

  def attempt_login
    if params[:username].present? && params[:password].present?
      found_user = AdminUser.where(username: params[:username]).first
      # so we don't get an array
      if found_user
        authorized_user = found_user.authenticate(params[:password])
      end
    end

    if authorized_user
      session[:user_id] = authorized_user.id
      flash[:notice] = "You are now logged in"
      redirect_to(admin_path)
    else
      flash.now[:notice] = "Invalid username,password combo"
      render('login')
    end
  end

  def logout
    session[:user_id] = nil
    flash[:notice] = 'logged out'
    redirect_to(access_login_path)
  end

  private

  def confirm_logged_in
    unless session[:user_id]
      flash[:notice] = "Please log in"
      redirect_to(access_login_path)
    end
  end

end
