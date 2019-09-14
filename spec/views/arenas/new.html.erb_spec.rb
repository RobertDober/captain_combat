require 'rails_helper'

RSpec.describe "arenas/new", type: :view do
  before(:each) do
    assign(:arena, Arena.new(
      :arena_name => "MyString",
      :arena_description => "MyText"
    ))
  end

  it "renders new arena form" do
    render

    assert_select "form[action=?][method=?]", arenas_path, "post" do

      assert_select "input[name=?]", "arena[arena_name]"

      assert_select "textarea[name=?]", "arena[arena_description]"
    end
  end
end
