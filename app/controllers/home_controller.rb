class HomeController < ApplicationController
  layout 'main'

  before_action :check_login
  before_action :fetch_user

  def index
    @matches = @user.get_matches(10)
  end
end
