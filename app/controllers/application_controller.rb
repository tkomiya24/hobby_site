class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

      def check_login

	      unless session[:user_id]
	        redirect_to(:controller => 'users', :action => 'login')
	        return false
	      else
	        return true
	      end

    end

    def back_to_home
		redirect_to(:controller => 'users', :action => 'show')
	end
end
