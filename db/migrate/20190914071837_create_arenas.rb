class CreateArenas < ActiveRecord::Migration[6.0]
  def change
    create_table :arenas do |t|
      t.string :arena_name
      t.text :arena_description

      t.timestamps
    end
  end
end
