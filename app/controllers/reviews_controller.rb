class ReviewsController < ApplicationController
  layout 'main'

  def new
    @review = Review.new
    @musician = Musician.find(params[:musician_id]).specific
  end
end
