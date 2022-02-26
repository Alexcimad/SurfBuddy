class ChangeDataTypeForSurfConditionsHours < ActiveRecord::Migration[6.0]
  def change
    change_column :surf_conditions, :start_hour, :datetime
    change_column :surf_conditions, :end_hour, :datetime
  end
end
