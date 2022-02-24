class SpotReviewsController < ApplicationController
  def index
    @spot_reviews = SpotReview.all
  end

  def show
    @spot_review = SpotReview.find(params[:id])
  end

  def new
    @surf_spot = SurfSpot.find(params[:surf_spot_id])
    @spot_review = SpotReview.new
  end

  def create
    @surf_spot = SurfSpot.find(params[:surf_spot_id])
    @spot_review = SpotReview.new(spot_review_params)
    @spot_review.user = current_user
    @spot_review.surf_spot = @surf_spot
    if @spot_review.save
      redirect_to surf_spot_path(@spot_review.surf_spot)
    else
      render "surf_spots/show"
    end
  end

  private

  def spot_review_params
    params.require(:spot_review).permit(:comment, :rating, :user_id, :surf_spot_id)
  end
end
