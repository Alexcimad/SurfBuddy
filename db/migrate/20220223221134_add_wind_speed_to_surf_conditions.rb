class AddWindSpeedToSurfConditions < ActiveRecord::Migration[6.0]
  def change
    add_column :surf_conditions, :wind_speed, :integer
  end
end
