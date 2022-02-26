class CreateFavoriteSpotTags < ActiveRecord::Migration[6.0]
  def change
    create_table :favorite_spot_tags do |t|
      t.references :favorite_spot, null: false, foreign_key: true
      t.references :tag, null: false, foreign_key: true

      t.timestamps
    end
  end
end
