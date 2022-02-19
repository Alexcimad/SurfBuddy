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
            FavoriteSpot.create(user: @user, surf_spot: @surf_spot)
        end
        respond_to do |format|
            format.html { render 'shared/_card_spot', locals: { surf_spot: @surf_spot, user: @user } }
            format.json { render json: { html: render_to_string(partial: "shared/_card_spot", locals: { surf_spot: @surf_spot, user: @user }, formats: [:html]) } }
          end
    end

    # def favorite
    #     @user = current_user
    #     @spot = SurfSpot.find(params[:surf_spot_id])
    #     @favorite_spot = FavoriteSpot.where(user: @user, surf_spot: @spot)
    #     if @favorite_spot.present?
    #       @favorite_spot.first.destroy
    #     else
    #       FavoriteSpot.create(user: @user, surf_spot: @spot)
    #     end
    #     respond_to do |format|
    #       format.html { render 'shared/_card', locals: { spot: @spot, user: @user } }
    #       format.json { render json: { html: render_to_string(partial: "shared/card", locals: { spot: @spot, user: @user }, formats: [:html]) } }
    #     end
    # end

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
