class Player < ApplicationRecord

  MIN_HITPOINTS = 80
  MAX_HITPOINTS = 140
  HITPOINTS_RANGE = MIN_HITPOINTS..MAX_HITPOINTS

  MIN_STRENGTH = 8
  MAX_STRENGTH = 14
  STRENGTH_RANGE = MIN_STRENGTH..MAX_STRENGTH

  validates :player_name, uniqueness: true, presence: true

  validates :hitpoints, inclusion: { in: HITPOINTS_RANGE }
  validates :strength, inclusion: { in: STRENGTH_RANGE }
    
end
