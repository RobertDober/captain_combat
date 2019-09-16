class RemovePlayer1AndPlayer2FromCombats < ActiveRecord::Migration[6.0]
  def change
    remove_reference :combats, :player1, null: false, foreign_key: {to_table: :players}
    remove_reference :combats, :player2, null: false, foreign_key: {to_table: :players}
  end
end
