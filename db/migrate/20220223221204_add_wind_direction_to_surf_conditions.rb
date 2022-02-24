class AddWindDirectionToSurfConditions < ActiveRecord::Migration[6.0]
  def change
    add_column :surf_conditions, :wind_direction, :string
  end
end
