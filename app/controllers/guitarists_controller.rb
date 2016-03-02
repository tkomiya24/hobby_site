class GuitaristsController < ApplicationController
  layout 'main'
  before_action :check_login

  def review
    review_with Guitarist.find(params[:reviewable_id])
  end
end
