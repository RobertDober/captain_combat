class RemoveCurrentHitpointsFromPlayers < ActiveRecord::Migration[6.0]
  def change

    remove_column :players, :current_hitpoints, :integer
  end
end
