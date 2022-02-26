class FavoriteSpotTagsController < ApplicationController

# CREATE
  def new
    @favorite_spot_tag = FavoriteSpotTag.new
  end

  def create
    FavoriteSpotTag.create(favorite_spot_id: params[:fav], tag_id: params[:tag_id])
  end

  def tag_delete
    @favorite_spot_tag = FavoriteSpotTag.find_by tag_id: params[:tag_id], favorite_spot_id: params[:fav]
    @favorite_spot_tag.destroy
  end   



end


