class AddWaveToSurfConditions < ActiveRecord::Migration[6.0]
  def change
    add_column :surf_conditions, :wave, :float
  end
end
