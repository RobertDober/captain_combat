require 'rails_helper'

RSpec.describe "arenas/index", type: :view do
  before(:each) do
    assign(:arenas, [
      Arena.create!(
        :arena_name => "Arena Name",
        :arena_description => "MyText"
      ),
      Arena.create!(
        :arena_name => "Arena Name",
        :arena_description => "MyText"
      )
    ])
  end

  it "renders a list of arenas" do
    render
    assert_select "tr>td", :text => "Arena Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
