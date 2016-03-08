class HomeController < ApplicationController
  layout 'welcome'

  before_action :fetch_user

  def index
  end
end
