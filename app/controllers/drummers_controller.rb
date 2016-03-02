class DrummersController < ApplicationController
  layout 'main'

  before_action :fetch_user
  before_action :check_login

  def review
    review_with Drummer.find(params[:reviewable_id])
  end
end
