require 'rails_helper'

RSpec.describe "arenas/show", type: :view do

  before do
    @arena = assign(:arena, create(:arena))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(%r{#{@arena.arena_name}})
    expect(rendered).to match(%r{#{@arena.arena_description}})
  end
end
