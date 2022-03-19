class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]
  def home
    @surf_spots = SurfSpot.all
    @users = User.all.length
    @surf_sessions = SurfSession.all.length
    @surf_spots_last = SurfSpot.last(3)
    @ftags = FavoriteSpotTag.all
  end
end
