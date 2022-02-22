class SurfConditionsController < ApplicationController
  def new
    @surf_condition = SurfCondition.new
  end
  
  def create
    @surf_spot = SurfSpot.new(surf_spot_params)

  end
end
