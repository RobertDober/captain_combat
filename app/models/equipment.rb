class Equipment < ApplicationRecord

  MAX_ATTACK    = 3
  MAX_DEFENSE    = 3
  ATTACK_RANGE  = 0..MAX_ATTACK
  DEFENSE_RANGE = 0..MAX_DEFENSE

  validate :utility


  private

  def utility
    if attack_strength.zero? && defense_strength.zero?
      errors.add(:base, "this equipment does not serve any purpose")
    end
  end
end
