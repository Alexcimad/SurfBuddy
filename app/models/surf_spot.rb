class SurfSpot < ApplicationRecord
  has_many :reviews, dependent: :destroy
end
