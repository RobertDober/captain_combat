require 'rails_helper'

RSpec.describe "combats/show", type: :view do
  before(:each) do
    @combat = assign(:combat, Combat.create!(
      :player1 => "",
      :player2 => ""
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
