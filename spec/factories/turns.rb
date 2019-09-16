FactoryBot.define do
  factory :turn do
    hit_with { 1 }
    hitpoints_left { 1 }
    attacker_name 
    defender_name
    association :combat
  end
end
