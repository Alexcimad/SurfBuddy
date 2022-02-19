class SurfSpotsController < ApplicationController
  #all surfspots
  def index
    if params[:search].present?
      if params[:search][:km].present?
        @surf_spots = SurfSpot.near(params[:search][:location],params[:search][:km])
      else
        @surf_spots = SurfSpot.near(params[:search][:location],100)
      end
    else
      @surf_spots = SurfSpot.all
    end

    @markers = @surf_spots.geocoded.map do |spot|
      {
        lat: spot.latitude,
        lng: spot.longitude,
        info_window: render_to_string(partial: "info_window", locals: { spot: spot })
      }
    end
  end

  # READ one
  def show
    @surf_spot = SurfSpot.find(params[:id])

    total_rating = 0
    @surf_spot.spot_reviews.each do |review|
      total_rating += review.rating 
    end
    @average_rating = total_rating / @surf_spot.spot_reviews.length.to_f
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
