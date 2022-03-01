require 'rest-client'
require 'httparty'

class SurfSpotsController < ApplicationController

  # before_action :set_tags, only: [:index, :show]
  skip_before_action :authenticate_user!, only: [:index, :show]

  #all surfspots
  def index
    if params[:search][:location].present?
      if params[:search][:km].present?
        @surf_spots = SurfSpot.near(params[:search][:location],params[:search][:km])
      else
        @surf_spots = SurfSpot.near(params[:search][:location], 20)
      end
    else
      @surf_spots = SurfSpot.all
    end

    @markers = @surf_spots.geocoded.map do |spot|
      {
        lat: spot.latitude,
        lng: spot.longitude,
        info_window: render_to_string(partial: "info_window", locals: { spot: spot }),
        image_url: choose_marker_icon(spot)
      }
    end
    set_tags
  end

  # READ one
  def show
    @spot_review = SpotReview.new
    @surf_spot = SurfSpot.find(params[:id])
    if @surf_spot.spot_reviews.present?
      total_rating = 0
      @surf_spot.spot_reviews.each do |review|
        total_rating += review.rating
      end
      @average_rating = total_rating / @surf_spot.spot_reviews.length.to_f
    else
      @average_rating = 0
    end
  end

  # NEW
  def new
    @surf_spot = SurfSpot.new
  end

  # def create
  def create
    @surf_spot = SurfSpot.new(surf_spot_params)
    @surf_spot.user = current_user
    if @surf_spot.save
      # test API respo
      redirect_to surf_spot_path(@surf_spot)
    else
      render :new
    end
  end

  # UPDATE
  def edit
    @surf_spot = SurfSpot.find(params[:id])
  end

  def update
    @surf_spot = SurfSpot.find(params[:id])
    @surf_spot.update(surf_spot_params)
    redirect_to surf_spots_path
  end

  # DELETE
  def destroy
    @surf_spot = SurfSpot.find(params[:id])
    @surf_spot.destroy
    redirect_to surf_spots_path
  end

  private

  def surf_spot_params
    params.require(:surf_spot).permit(:title, :description, :longitude, :latitude, :location, :created_at, :updated_at, photos: [])
  end

  def set_tags
    @ftags = FavoriteSpotTag.all
  end

  def choose_marker_icon(v_spot)
    if v_spot.surf_conditions[0].level == "Beginner"
      return helpers.asset_url("level_beginner.png")
    elsif v_spot.surf_conditions[0].level == "Intermediate"
      return helpers.asset_url("level_intermediate.png")
    else
      return helpers.asset_url("level_expert.png")
    end

  end

end
