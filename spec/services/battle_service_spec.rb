require 'rails_helper'
RSpec.describe BattleService do

  let(:combat) { create :combat }
  let(:player1) { create :player }
  let(:player2) { create :player }

  describe "validation" do

    it "no errors, 'cause everything's correct" do
      described_class.new(combat, {"player1_id" => player1.id.to_s,
                                   "player2_id" => player2.id.to_s}).validate
      expect( combat ).to be_valid
    end

    it "nobody shallt fight herself" do
      described_class.new(combat, {"player1_id" => player1.id.to_s,
                                   "player2_id" => player1.id.to_s}).validate
      expect( combat.errors[:base] ).to eq(["player #{player1.player_name} must not fight herself"])
    end
  end
end
