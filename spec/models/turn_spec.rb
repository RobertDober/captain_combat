require 'rails_helper'

RSpec.describe Turn, type: :model do

  describe "Fiat Lux" do
    let(:turn) { create :turn }

    it "works" do
      expect( turn.combat.turns ).to eq([turn])
    end
  end
end
