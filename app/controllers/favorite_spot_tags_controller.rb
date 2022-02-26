class FavoriteSpotTagsController < ApplicationController

# CREATE
  def new
    @favorite_spot_tag = FavoriteSpotTag.new
  end

  def create
    FavoriteSpotTag.create(favorite_spot_id: params[:fav], tag_id: params[:tag_id])
  end


end


