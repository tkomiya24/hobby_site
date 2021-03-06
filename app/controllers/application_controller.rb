class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

  private

  def success_flash
    flash[:notice] = 'Your profile has been updated successfully'
    flash[:class] = 'alert-success'
  end

  def check_login
    if session[:user_id]
      return true
    else
      redirect_to(controller: 'users', action: 'login')
      return false
    end
  end

  def back_to_home
    redirect_to(controller: 'users', action: 'show')
  end

  def fetch_user
    @user = User.find(session[:user_id]) if session[:user_id]
  end

  def redirect_to_user
    flash[:notice] = 'Changes successful!'
    redirect_to(controller: 'users', action: 'show')
  end

  def review_with(reviewable)
    @review = Review.new
    @review.reviewable = reviewable
    @review.user = @user
    render 'reviews/new'
  end
end
