require 'rails_helper'

RSpec.describe "combats/edit", type: :view do
  before(:each) do
    @combat = assign(:combat, Combat.create!(
      :player1 => "",
      :player2 => ""
    ))
  end

  it "renders the edit combat form" do
    render

    assert_select "form[action=?][method=?]", combat_path(@combat), "post" do

      assert_select "input[name=?]", "combat[player1]"

      assert_select "input[name=?]", "combat[player2]"
    end
  end
end
