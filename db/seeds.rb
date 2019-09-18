# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Player resuscitation not being implemented yet we ignore dead players
module Seeder extend self
  def seed_arena
    FactoryBot.create :arena
  end
  def seed_equipment
    ->(_) { FactoryBot.create :equipment }
  end
  def seed_player
    ->(_) { FactoryBot.create :player }
  end
end

Seeder.seed_arena unless Arena.count.positive?

PLAYER_STOCK=10
(1..PLAYER_STOCK).each(&Seeder.seed_player) unless Player.any?

EQUIPMENT_STOCK=10
(1..EQUIPMENT_STOCK).each(&Seeder.seed_equipment) unless Equipment.any?


