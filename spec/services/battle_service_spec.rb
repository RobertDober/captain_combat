require 'rails_helper'
RSpec.describe BattleService do

  let(:combat) { create :combat }
  let(:player1) { create :player }
  let(:player2) { create :player }

  describe "validation" do

    it "no errors, 'cause everything's correct" do
      described_class.new(combat, {"player1_id" => player1.id.to_s,
                                   "player2_id" => player2.id.to_s})
      expect( combat ).to be_valid
    end

    it "nobody shallt fight herself" do
      described_class.new(combat, {"player1_id" => player1.id.to_s,
                                   "player2_id" => player1.id.to_s})
      expect( combat.custom_errors ).to eq(["player #{player1.player_name} must not fight herself"])
    end

    it "both players need to exist" do
      described_class.new(combat, {"player1_id" => player1.id.to_s,
                                   "player2_id" => player1.id.succ.to_s})
      expect( combat.custom_errors ).to eq(["player2 does not exist"])
    end
    it "both players need to exist, both, really" do
      described_class.new(combat, {"player1_id" => player1.id.succ.to_s,
                                   "player2_id" => player1.id.to_s})
      expect( combat.custom_errors ).to eq(["player1 does not exist"])
    end
  end


  describe "to the death" do

    let(:player1) { create :player }
    let(:player2) { create :player }
    before do
      @combat = create(:combat)
      # bs stands for BattleService, really, no kidding!!!
      @bs     = BattleService.new combat, "player1_id" => player1.id, "player2_id" => player2.id
      @bs.run
    end

    context "recorded turns" do
      it "first attacker was player1" do
        expect(combat.turns.first.attacker_name).to eq(player1.player_name)
      end
      it "last turn's defender's health was not too good" do
        expect(combat.turns.last.hitpoints_left ).to be_zero
      end
    end
  end
end
