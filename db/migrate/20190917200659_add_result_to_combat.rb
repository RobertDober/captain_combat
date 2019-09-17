class AddResultToCombat < ActiveRecord::Migration[6.0]
  def change
    add_column :combats, :result, :text
  end
end
