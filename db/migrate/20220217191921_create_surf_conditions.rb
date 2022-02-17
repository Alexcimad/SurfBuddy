class CreateSurfConditions < ActiveRecord::Migration[6.0]
  def change
    create_table :surf_conditions do |t|
      t.string :level
      t.float :swell
      t.integer :period
      t.integer :water_temp
      t.references :surf_spot, null: false, foreign_key: true
      t.date :start_hour
      t.date :end_hour

      t.timestamps
    end
  end
end
