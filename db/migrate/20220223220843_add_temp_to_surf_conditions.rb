class AddTempToSurfConditions < ActiveRecord::Migration[6.0]
  def change
    add_column :surf_conditions, :temp, :integer
  end
end
