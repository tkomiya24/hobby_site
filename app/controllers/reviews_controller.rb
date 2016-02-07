class ReviewsController < ApplicationController
  layout 'main'

  def new
    @review = Review.new
    @review.reviewable = Musician.find(params[:musician_id]).specific
  end
end
