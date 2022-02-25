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

  def favoriteTag
    @user = current_user
    @favorite_spot = FavoriteSpot.where(user: @user)
    @favorite = FavoriteSpotTag.where(favorite_spot: @favorite_spot)
  raise
    if @favorite.present?
        @favorite.first.destroy
    else
      FavoriteSpotTag.create(user: @user, tag: @tag)
    end
      # respond_to do |format|
      #     format.html { render 'shared/_card_spot', locals: { surf_spot: @surf_spot, user: @user } }
      #     format.json { render json: { html: render_to_string(partial: "shared/_card_spot", locals: { surf_spot: @surf_spot, user: @user }, formats: [:html]) } }
      #   end
  end
end
  

