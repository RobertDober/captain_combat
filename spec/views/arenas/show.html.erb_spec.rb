require 'rails_helper'

RSpec.describe "arenas/show", type: :view do
  before(:each) do
    @arena = assign(:arena, Arena.create!(
      :arena_name => "Arena Name",
      :arena_description => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Arena Name/)
    expect(rendered).to match(/MyText/)
  end
end
