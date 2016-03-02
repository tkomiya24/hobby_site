class SingersController < ApplicationController
  layout 'main'
  before_action :check_login

  def review
    review_with Singer.find(params[:reviewable_id])
  end
end
