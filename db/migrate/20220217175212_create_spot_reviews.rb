class CreateSpotReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :spot_reviews do |t|
      t.text :comment
      t.integer :rating
      t.references :surf_spot, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
