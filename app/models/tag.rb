class Tag < ApplicationRecord
    has_many :favorite_spot_tags, dependent: :destroy
end
