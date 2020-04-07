class ReviewsController < ApplicationController

  def index
    @reviews = Review.all
  end
  def create
    @review = Review.new(review_params)
    @review.cocktail_id = params['cocktail_id']
    @review.save


    redirect_to cocktail_path(@review.cocktail)
  end

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
