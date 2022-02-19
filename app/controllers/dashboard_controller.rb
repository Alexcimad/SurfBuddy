class DashboardController < ApplicationController
    skip_before_action :authenticate_user!, only: [ :profile ]
    def profile
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
    
        @favorite_spots = FavoriteSpot.all.where(user_id: current_user)
        
      end
end