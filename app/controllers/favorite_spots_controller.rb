class FavoriteSpotsController < ApplicationController
# CREATE
#   def new
#     @favorite_spots = FavoriteSpot.new
#   end

  def create
    @favorite_spots = FavoriteSpot.new(favorite_spots_params)
    @favorite_spots.user = current_user
    if @favorite_spots.save
      redirect_to favorite_spots_path(@favorite_spots)
    else
      render :new
    end
  end

  private

  def favorite_spots_params
    params.require(:surf_spot).permit(:surf_spot_id, :user_id)
  end
end
