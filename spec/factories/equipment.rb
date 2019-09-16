FactoryBot.define do
  factory :equipment do
    equipment_name
    attack_strength { Random.rand(Equipment::ATTACK_RANGE) }
    defense_strength {  [Random.rand(Equipment::DEFENSE_RANGE), (attack_strength.zero? ? 1 : 0)].max }
  end
end
