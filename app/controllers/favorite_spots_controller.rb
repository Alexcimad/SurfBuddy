class FavoriteSpotsController < ApplicationController
# CREATE
#   def new
#     @favorite_spots = FavoriteSpot.new
#   end

    def favorite
        @user = current_user
        @surf_spot = SurfSpot.find(params[:surf_spot_id])
        @favorite = FavoriteSpot.where(user: @user, surf_spot: @surf_spot)
        # raise
        if @favorite.present?
            @favorite.first.destroy
        else
            FavoriteSpot.create(favorite_spots_params)
        end
        respond_to do |format|
            format.html { redirect_to surf_spots_path }
            format.js { {surf_spot: @surf_spot, user: @user}}
        end
    end

    # def create
    #     @favorite_spots = FavoriteSpot.new(favorite_spots_params)
    #     @favorite_spots.user = current_user
    #     if @favorite_spots.save
    #         redirect_to favorite_spots_path(@favorite_spots)
    #     else
    #         render :new
    #     end
    # end

    # def destroy
    #     @favorite_spots = FavoriteSpot.find(params[:id])
    #     @favorite_spots.destroy
    # end


  private

  def favorite_spots_params
    params.require(:surf_spot).permit(:surf_spot_id, :user_id)
  end
end
