class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  def check_login
    if session[:user_id]
      return true
    else
      redirect_to(controller 'users', action: 'login')
      return false
    end
  end

  def back_to_home
    redirect_to(controller: 'users', action: 'show')
  end

  def get_user
    @user = User.find(session[:user_id])
  end
end
