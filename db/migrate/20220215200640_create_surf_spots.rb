class CreateSurfSpots < ActiveRecord::Migration[6.0]
  def change
    create_table :surf_spots do |t|
      t.string :location
      t.float :longitude
      t.float :latitude
      t.text :description

      t.timestamps
    end
  end
end
