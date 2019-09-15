# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Player resuscitation not being implemented yet we ignore dead players
module Seeder extend self
  def seed_player
    ->(_) { FactoryBot.create :player }
  end
end

PLAYER_STOCK=10
(1..(PLAYER_STOCK-Player.alive.count)).each(&Seeder.seed_player)


