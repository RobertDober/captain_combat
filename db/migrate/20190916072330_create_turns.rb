class CreateTurns < ActiveRecord::Migration[6.0]
  def change
    create_table :turns do |t|
      t.integer :hit_with
      t.integer :hitpoints_left
      t.string :attacker_name
      t.string :defender_name

      t.references :combat
      t.timestamps
    end
  end
end
