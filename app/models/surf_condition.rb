class SurfCondition < ApplicationRecord
  belongs_to :surf_spot
  belongs_to :surf_session, optional: true, dependent: :destroy
end
