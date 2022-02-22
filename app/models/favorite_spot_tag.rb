class FavoriteSpotTag < ApplicationRecord
  belongs_to :favorite_spot
  belongs_to :tag
end
