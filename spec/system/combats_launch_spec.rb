require 'rails_helper'

RSpec.describe "Launch Combat", type: :system do

  let!(:arena) { create :arena }
  let!(:player1) { create :player }
  let!(:player2) { create :player }

  describe "workflow to select players and launch a battle" do
    it "chose players" do
      visit "/"
      click_on "Launch a fight"
      find( '#combat_player1_id' ).select( player1.player_name )
      find( '#combat_player2_id' ).select( player2.player_name )
    end
  end
end
