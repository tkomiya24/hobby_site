class HomeController < ApplicationController
  layout 'main'

  before_action :check_login
  before_action :fetch_user

  def index
    @matches = @user.find_matches
  end
end
