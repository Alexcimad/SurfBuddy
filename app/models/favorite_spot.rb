class FavoriteSpot < ApplicationRecord
  belongs_to :user
  belongs_to :surf_spot
  has_many :favorite_spot_tags, dependent: :destroy
  has_many :tags, through: :favorite_spot_tags
end
