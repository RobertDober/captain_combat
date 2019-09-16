require 'rails_helper'

RSpec.describe "Home Page", type: :system do

  let!(:arena) { create :arena }

  it "can go home" do
    visit "/"
    expect( page ).to have_text("Arena name: #{arena.arena_name}")
    assert_selector %{a[href="/combats/new"]}, text: "Launch a fight"
  end
end
