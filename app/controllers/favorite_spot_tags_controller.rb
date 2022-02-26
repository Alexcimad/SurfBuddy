class FavoriteSpotTagsController < ApplicationController

# CREATE
  def new
    @favorite_spot_tag = FavoriteSpotTag.new
  end

  def create
    @favorite_spot_tag = FavoriteSpotTag.new(favorite_spot_tag_params)
    # @favorite_spot_tag.user = current_user
    if @favorite_spot_tag.save
      redirect_to favorite_spot_tag_path(@favorite_spot_tag) #modifier
    else
      render :new
    end
  end

end

