class BattleService

  attr_reader :combat, :player1, :player2

  def validate
    if player1.id == player2.id
      combat.errors.add(:base, "player #{player1.player_name} must not fight herself")
    end
  end


  private

  def initialize combat, params
    @combat  = combat
    @player1 = Player.find_by(id: params["player1_id"])
    @player2 = Player.find_by(id: params["player2_id"])
  end
end
