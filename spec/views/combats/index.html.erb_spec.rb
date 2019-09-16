require 'rails_helper'

RSpec.describe "combats/index", type: :view do
  before(:each) do
    assign(:combats, [
      Combat.create!(
        :player1 => "",
        :player2 => ""
      ),
      Combat.create!(
        :player1 => "",
        :player2 => ""
      )
    ])
  end

  it "renders a list of combats" do
    render
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
