class AddCurrentHitpointsToPlayer < ActiveRecord::Migration[6.0]
  def change
    add_column :players, :current_hitpoints, :integer
  end
end
