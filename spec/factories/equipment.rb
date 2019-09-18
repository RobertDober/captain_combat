FactoryBot.define do
  factory :equipment do
    equipment_name
    attack_strength { Random.rand(Equipment::ATTACK_RANGE) }
    defense_strength {  attack_strength.zero? ? Random.rand(1..Equipment::MAX_DEFENSE) : 0 }

    factory :weapon do
      attack_strength { Random.rand(1..Equipment::MAX_ATTACK) }
      defense_strength { 0 }
    end
  end
end
