class RemoveSurfSpotFromSurfSessions < ActiveRecord::Migration[6.0]
  def change
    remove_reference :surf_sessions, :surf_spot, null: false, foreign_key: true
  end
end
