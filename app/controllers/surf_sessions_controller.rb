class SurfSessionsController < ApplicationController
  
  def create 
    SurfSession.create!(surf_condition_id: params[:surf_cond], user_id: params[:user_session])
    redirect_to profile_path
  end

  def index
    @surf_sessions = SurfSession.all
  end

end
