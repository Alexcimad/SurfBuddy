class SurfSpot < ApplicationRecord
  has_many :spot_reviews, dependent: :destroy
  # validates :location, :description, presence: true

end
