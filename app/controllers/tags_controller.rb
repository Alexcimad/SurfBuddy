class TagsController < ApplicationController

# CREATE
  def new
    @tag = Tag.new
  end

  def create
    @tag = Tag.new(tag_params)
    # @tag.user = current_user
    if @tag.save
      redirect_to tag_path(@tag) #modifier
    else
      render :new
    end
  end
#INDEX
  def index
      @tags = Tag.all
  end

  def favorite_tag
    tag = Tag.find(params[:id])
    @favorite_spots = FavoriteSpot.where(user: @user)
    @favorite_spots.flat_map(&:tags).include?(tag)
# byebug
#     @favorite = FavoriteSpotTag.where(favorite_spot: @favorite_spot, tag: tag)
    if current_user.favorite_spots.flat_map(&:tags).include?(tag)
      tag.favorite_spot_tag.destroy
    else
      FavoriteSpotTag.create(favorite_spot_id: @favorite_spot.id, tag: tag)
    end
      # respond_to do |format|
      #     format.html { render 'shared/_card_spot', locals: { surf_spot: @surf_spot, user: @user } }
      #     format.json { render json: { html: render_to_string(partial: "shared/_card_spot", locals: { surf_spot: @surf_spot, user: @user }, formats: [:html]) } }
      #   end
  end
end
  

