class SurfSpot < ApplicationRecord
  has_many :spot_reviews, dependent: :destroy
  has_many :favorite_spots, dependent: :destroy
  has_many_attached :photos
  # validates :location, :description, presence: true
  geocoded_by :location
  has_many :surf_conditions, dependent: :destroy
  after_validation :geocode, if: :will_save_change_to_location?
end
