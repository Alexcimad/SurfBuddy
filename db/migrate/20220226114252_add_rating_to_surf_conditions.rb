class AddRatingToSurfConditions < ActiveRecord::Migration[6.0]
  def change
    add_column :surf_conditions, :rating, :integer
  end
end
