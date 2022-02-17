class CreateSurfSessions < ActiveRecord::Migration[6.0]
  def change
    create_table :surf_sessions do |t|
      t.references :user, null: false, foreign_key: true
      t.references :surf_spot, null: false, foreign_key: true

      t.timestamps
    end
  end
end
