class SurfSession < ApplicationRecord
  belongs_to :user
  belongs_to :surf_spot
end
