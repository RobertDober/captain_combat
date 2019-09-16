require 'rails_helper'

RSpec.describe Combat, type: :model do

  describe "validity" do
    it "is not valid if not both players exist" do
      expect{ create :combat, player1_id: nil }.to raise_error(ActiveRecord::RecordInvalid)
    end
    it "is not valid if a combat has the same players" do
      combat = create :combat
      combat.player2_id = combat.player1_id
      expect( combat ).not_to be_valid
    end
  end

  describe "to the death" do
    before do
      @combat = create(:combat).run
    end
    let(:players) { [@combat.player1, @combat.player2] }
    let(:turns) { @combat.turns.order(:id) }


    it "is quite letal, right?, but not for everyone" do
      expect(players.count(&:alive?)).to  eq(1)
    end

    context "recorded turns" do
      it "first attacker was player1" do
        expect(turns.first.attacker_name).to eq(@combat.player1.player_name)
      end
      it "last turn's defender's health was not too good" do
        expect( turns.last.hitpoints_left ).to be_zero
      end
    end
  end
end
