class ReviewsController < ApplicationController
  layout 'main'

  def show
    @review = Review.find(params[:id])
  end

  def new
    @review = Review.new
    @musician = Musician.find(params[:musician_id]).specific
  end

  def create
    @review = Review.new(params.require(:review).permit(:rating, :review))
    @review.user = fetch_user
    @review.reviewable = Musician.find(params[:musician_id])
    if @review.save
      redirect_to musician_review_path(@review.reviewable, @review)
    else
      render('new')
    end
  end

  private

  def musician
    Musician.find(params[:musician_id])
  end
end
