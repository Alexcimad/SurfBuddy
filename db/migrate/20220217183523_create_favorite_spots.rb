class CreateFavoriteSpots < ActiveRecord::Migration[6.0]
  def change
    create_table :favorite_spots do |t|
      t.references :user, null: false, foreign_key: true
      t.references :surf_spot, null: false, foreign_key: true

      t.timestamps
    end
  end
end
