FactoryBot.define do
  factory :combat do
    association :player1, factory: :player
    association :player2, factory: :player
  end
end
