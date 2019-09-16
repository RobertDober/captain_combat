require 'rails_helper'

RSpec.describe Player, type: :model do

  describe "a valid player can be constructed" do
    it { create :player }
  end

  describe "however..., validation might kick in" do
    context "strength" do
      it "needs a certain minimum" do
        expect( build(:player, strength: Player::MIN_STRENGTH.pred )).not_to be_valid
      end
      it "too much is too much, though" do
        expect( build(:player, strength: Player::MAX_STRENGTH.succ )).not_to be_valid
      end
    end
    context "hitpoints" do
      it "needs a certain minimum" do
        expect( build(:player, hitpoints: Player::MIN_HITPOINTS.pred )).not_to be_valid
      end
      it "too much is too much, though" do
        expect( build(:player, hitpoints: Player::MAX_HITPOINTS.succ )).not_to be_valid
      end
    end
    context "current_hitpoints" do
      it "needs a certain minimum" do
        player = build(:player)
        player.current_hitpoints = player.hitpoints.succ
        expect(player).not_to be_valid
      end
      it "too much is too much, though" do
        expect( build(:player, hitpoints: Player::MAX_HITPOINTS.succ )).not_to be_valid
      end
    end

    context "player_name" do
      it "is needed, really" do
        expect( build(:player, player_name: "" )).not_to be_valid
      end
      it "is needed to be unique, really again" do
        player = create :player
        expect( build(:player, player_name: player.player_name )).not_to be_valid
      end
    end

  end

  describe "alive or not alive" do
    it "is definitely alive" do
      expect( build :player ).to be_alive
    end
    it "He's dead, Jim!" do
      expect( build :player, current_hitpoints: 0 ).not_to be_alive
    end
    it "one to count them all?" do
      players = [0, Player::MIN_HITPOINTS, 0]
        .map{ |hp| create :player, current_hitpoints: hp }
      expect( described_class.alive.pluck(:current_hitpoints) ).to eq([Player::MIN_HITPOINTS])
    end
  end
end
