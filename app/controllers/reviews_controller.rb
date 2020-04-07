class ReviewsController < ApplicationController

  def create
    @review = Review.new(content: params["content"], rating: params["rating"])
    @review.save


    redirect_to "/#{params[:id]}"
  end
end
