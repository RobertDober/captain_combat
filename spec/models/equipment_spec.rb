require 'rails_helper'

RSpec.describe Equipment, type: :model do

  describe "valid instances" do
    it { create :equipment }
  end

  describe "invalid instances" do
    it "needs to be good for something" do
      zero = build( :equipment, attack_strength: 0, defense_strength: 0 )
      expect(zero).not_to be_valid
      expect(zero.errors[:base]).to eq(["this equipment does not serve any purpose"])
    end

    skip "equipment_name must be unique"

  end
end
