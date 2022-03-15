class SurfSpot < ApplicationRecord
  has_many :spot_reviews, dependent: :destroy
  has_many :favorite_spots, dependent: :destroy
  has_many_attached :photos
  # validates :location, :description, presence: true
  geocoded_by :location
  has_many :surf_conditions, dependent: :destroy
  after_validation :geocode, if: :will_save_change_to_location?

  def best_surf_condition(user)
    level_surf_conditions = surf_conditions.select { |surf_condition| surf_condition.level == user.level}
    best_surf_cond = level_surf_conditions.max_by { |surf_cond|  surf_cond.rating}
  end

end
