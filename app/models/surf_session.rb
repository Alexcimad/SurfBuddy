class SurfSession < ApplicationRecord
  belongs_to :user
  has_one :surf_condition
end
