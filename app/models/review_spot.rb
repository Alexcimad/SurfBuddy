class ReviewSpot < ApplicationRecord
  belongs_to :surf_spot
  belongs_to :user
end
