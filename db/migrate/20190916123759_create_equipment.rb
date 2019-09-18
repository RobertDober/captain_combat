class CreateEquipment < ActiveRecord::Migration[6.0]
  def change
    create_table :equipment do |t|
      t.string :equipment_name
      t.integer :attack_strength
      t.integer :defense_strength

      t.timestamps
    end
  end
end
