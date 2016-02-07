class ReviewsController < ApplicationController
  layout 'main'

  def new
    @review = Review.new
    @musician = Musician.find(params[:musician_id]).specific
  end

  def create
    @review = Review.new(params.require(:review).permit(:rating, :review))
    @review.user = fetch_user
    @review.reviewable = Musician.find(params[:musician_id]).specific
    if @review.save
      redirect_to_user
    else
      render('new')
    end
  end
end
