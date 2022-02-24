class SpotReview < ApplicationRecord
  belongs_to :surf_spot
  belongs_to :user

  validates :comment, :rating, presence: true
  validates :rating, numericality: { only_integer: true, in: (0..5) }
end
