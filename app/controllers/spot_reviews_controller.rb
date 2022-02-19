class SpotReviewsController < ApplicationController
  def index
    @spot_reviews = SpotReview.all
  end

  def show
    @spot_review = SpotReview.find(params[:id])
  end

  private

  def spot_reviews_params
    params.require(:spot_review).permit(:comment, :rating, :user_id, :surf_spot_id)
  end
end
