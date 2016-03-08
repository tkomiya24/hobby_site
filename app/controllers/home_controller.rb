class HomeController < ApplicationController
  layout 'welcome'

  before_action :fetch_user

  def index
    redirect_to(user_path) if @user
  end
end
