class BattleService
require 'battle_service/validator'

  include Validator

  attr_reader :combat, :player1, :player2
  attr_reader :p1_state, :p2_state


  def run
    raise RuntimeError, "illegal combat:#{combat.custom_errors.join("\n")}" unless combat.custom_errors.empty? 
    do_run
    combat.update result: result
  end


  def result
    if can_continue?
      "The battle is not finished yet, be patient..."
    else
      recap
    end
  end


  private

  def initialize combat, params
    @combat  = combat
    @player1 = Player.find_by(id: params["player1_id"])
    @player2 = Player.find_by(id: params["player2_id"])
    validate
    return unless combat.custom_errors.empty?
    init
  end

  def init
    @p1_state = OpenStruct.new(
      hitpoints: player1.hitpoints,
      strength: player1.strength,
      player_name: player1.player_name)
    @p2_state = OpenStruct.new(
      hitpoints: player2.hitpoints,
      strength: player2.strength,
      player_name: player2.player_name)
  end

  def do_run
    [[p1_state, p2_state], [p2_state, p1_state]]
      .cycle
      .take_while{ |attacker, defender|
      make_turn(attacker, defender)
    }
  end

  def can_continue?
    p1_state.hitpoints.positive? && p2_state.hitpoints.positive? 
  end

  def loser
    return @__loser__ if @__loser__
    return if can_continue?
    @__looser__ = player1.alive? ? player2 : player1
  end

  def make_turn attacker, defender
    hit = attacker.strength - rand(attacker.strength/4 + 1)
    defender.hitpoints = [0, defender.hitpoints - hit].max

    combat.turns.create(
      attacker_name: attacker.player_name,
      defender_name: defender.player_name,
      hit_with: hit,
      hitpoints_left: defender.hitpoints)

    can_continue?
  end

  def recap
    "#{winner.player_name} won, remaining health: #{winner.hitpoints}"
  end

  def winner
    return @__winner__ if @__winner__
    return if can_continue?
    @__winner__ = p1_state.hitpoints.zero? ? p2_state : p1_state 
  end

end
