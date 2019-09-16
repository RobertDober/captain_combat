require 'rails_helper'

RSpec.describe "combats/new", type: :view do
  before(:each) do
    @comabt = assign(:combat, Combat.new) 
  end

  it "renders new combat form" do
    render

    assert_select "form[action=?][method=?]", combats_path, "post" do

      assert_select "input[name=?]", "combat[player1]"

      assert_select "input[name=?]", "combat[player2]"
    end
  end
end
