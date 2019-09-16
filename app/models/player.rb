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

  validate :current_hitpoints_range

  scope :alive, -> { where('current_hitpoints > 0') }
  # One day, may friends, one happy day, Rails v42 will
  # implement a predicate for each scope, until then...
  def alive?; current_hitpoints > 0 end

  private

  def current_hitpoints_range
    if current_hitpoints.negative? || current_hitpoints > hitpoints
      errors.add(:current_hitpoints,
                 "current_hitpoints are #{current_hitpoints}, but must be in 0..#{hitpoints}")
    end
  end
    
end
