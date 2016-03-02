class HomeController < ApplicationController
  layout 'main'

  before_action :fetch_user

  def index
  end
end
