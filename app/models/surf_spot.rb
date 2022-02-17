class SurfSpot < ApplicationRecord
  has_many :spot_reviews, dependent: :destroy
end
