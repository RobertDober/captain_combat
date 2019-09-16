class Combat < ApplicationRecord
   belongs_to :player1, class_name: "Player", validate: true
   belongs_to :player2, class_name: "Player", validate: true

   has_many :turns

   validate :uniqueness_of_players

   def run
     [[player1, player2], [player2, player1]]
       .cycle
       .take_while{ |attacker, defender|
         make_turn(attacker, defender)
       }
     player1.save!
     player2.save!

     self
   end

   def result
     if can_continue?
       "The battle is not finished yet, be patient..."
     else
       recap
     end
   end

   private

   def can_continue?
     player1.alive? && player2.alive?
   end

   def loser
     return @__loser__ if @__loser__
     return if can_continue?
     @__looser__ = player1.alive? ? player2 : player1
   end

   def make_turn attacker, defender
     hit = attacker.strength - rand(attacker.strength/4 + 1)
     defender.current_hitpoints = [0, defender.current_hitpoints - hit].max

     turns.create(
       attacker_name: attacker.player_name,
       defender_name: defender.player_name,
       hit_with: hit,
       hitpoints_left: defender.current_hitpoints)

     can_continue?
   end

   def recap
     "#{winner.player_name} won, remaining health: #{winner.current_hitpoints}"
   end

   def uniqueness_of_players
     if player1_id == player2_id
       errors.add(:base, "The same player cannot combat herself")
     end
   end

   def winner
     return @__winner__ if @__winner__
     return if can_continue?
     @__winner__ = player1.alive? ? player1 : player2
   end
end
