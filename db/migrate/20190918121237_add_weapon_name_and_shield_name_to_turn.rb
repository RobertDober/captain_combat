class AddWeaponNameAndShieldNameToTurn < ActiveRecord::Migration[6.0]
  def change
    add_column :turns, :weapon_name, :string
    add_column :turns, :shield_name, :string
  end
end
