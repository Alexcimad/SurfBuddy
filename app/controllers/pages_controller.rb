class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :profile ]
  def home
  end

  def profile
    @level = params[:level]
  end
end
