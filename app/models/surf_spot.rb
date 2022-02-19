class SurfSpot < ApplicationRecord
  has_many :spot_reviews, dependent: :destroy
  # validates :location, :description, presence: true
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
end
