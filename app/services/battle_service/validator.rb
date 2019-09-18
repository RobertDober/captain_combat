module BattleService::Validator

  private

  def validate
    validate_existance && 
      validate_distinct
  end

  def validate_distinct
    if combat.valid? && player1.id == player2.id
      combat.custom_errors << "player #{player1.player_name} must not fight herself"
    end
  end

  def validate_existance
    combat.custom_errors << "player1 does not exist" unless player1
    combat.custom_errors << "player2 does not exist" unless player2
    return player1 && player2
  end
  
end
