class DashboardController < ApplicationController
    skip_before_action :authenticate_user!, only: [ :profile ]
    def profile
      @tags = Tag.all
      if params[:level].present?
        @level = params[:level]
        @user = current_user
        @user.level = @level
        if @user.save
          redirect_to profile_path
        else
          render :new
        end
      else
        @user = current_user
      end
      set_tags
      @favorite_spots = @user.favorite_spots  


      @surf_sessions = SurfSession.where(user_id: current_user)

    end

    private 

    def set_tags
      @ftags = FavoriteSpotTag.all
    end
end

# FavoriteSpot.where(user_id: current_user)