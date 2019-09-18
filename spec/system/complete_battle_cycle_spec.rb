require 'rails_helper'

RSpec.describe "Complete Battle Cycle (after error)", type: :system do

  let!(:arena) { create :arena }
  let!(:player1) { create :player }
  let!(:player2) { create :player }

  let(:last_turn) { Turn.order(:id).last }


  describe "workflow to select players and launch a battle" do
    it "chose 2 players, launch" do
      visit "/"
      click_on "Launch your battle"
      assert_selector "h4", text: "Configure your battle"
      find( '#combat_player1_id' ).select( player1.player_name )
      find( '#combat_player2_id' ).select( player2.player_name )
      find( '#combat_weapon1_id' ).select( "---" )
      find( '#combat_weapon2_id' ).select( "---" )
      click_on "Start your battle"
      assert_selector "h4", text: "Battle recap"
      within("tbody>tr:last-child") do |last_row|
        assert_selector "td:first-child", text: last_turn.attacker_name
        assert_selector "td:nth-child(3)", text: "nothing"
        assert_selector "td:last-child", text: "dead"
      end
      click_on "Launch a new battle"
      assert_selector "h4", text: "Configure your battle"
    end

    it "chose only one player, correct error, launch" do
      visit "/"
      click_on "Launch your battle"
      assert_selector "h4", text: "Configure your battle"
      find( '#combat_player1_id' ).select( player1.player_name )
      find( '#combat_player2_id' ).select( player1.player_name )
      click_on "Start your battle"
      assert_selector "#error_explanation>h2", text: "1 error"
      click_on "Launch a new battle"
      assert_selector "h4", text: "Configure your battle"
      find( '#combat_player1_id' ).select( player1.player_name )
      find( '#combat_player2_id' ).select( player2.player_name )
      click_on "Start your battle"
      assert_selector "h4", text: "Battle recap"
      within("tbody>tr:last-child") do |last_row|
        assert_selector "td:first-child", text: last_turn.attacker_name
        assert_selector "td:last-child", text: "dead"
      end
      click_on "Launch a new battle"
      assert_selector "h4", text: "Configure your battle"
    end
  end
end
