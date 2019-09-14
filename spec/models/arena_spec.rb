require 'rails_helper'

RSpec.describe Arena, type: :model do

  describe "validation of uniqueness" do

    it "is valid if the names differ" do
      create :arena
      arena1 = build :arena
      expect(arena1).to be_valid
    end

    it "is not valid if they are the same" do
      arena = create :arena
      arena1 = build(:arena, arena_name: arena.arena_name)
      expect( arena1 ).not_to be_valid
    end
  end
end
