class SurfSpotsController < ApplicationController
  #all surfspots
  def index
    @surf_spots = SurfSpot.all
  end

  # READ one
  def show
    @surf_spot = SurfSpot.find(params[:id])
    # respond_to do |format|
    #   format.html
    #   format.js
    # end
  end

  # CREATE
  def new
    @surf_spot = SurfSpot.new
  end

  def create
    @surf_spot = SurfSpot.new(surf_spot_params)
    @surf_spot.user = current_user
    if @surf_spot.save
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
end
