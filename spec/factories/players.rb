FactoryBot.define do
  factory :player do
    player_name
    hitpoints { Random.rand(Player::HITPOINTS_RANGE) }
    strength { Random.rand(Player::STRENGTH_RANGE) }

    current_hitpoints { hitpoints }
  end
end
