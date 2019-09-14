require 'rails_helper'

RSpec.describe "arenas/edit", type: :view do
  before(:each) do
    @arena = assign(:arena, Arena.create!(
      :arena_name => "MyString",
      :arena_description => "MyText"
    ))
  end

  it "renders the edit arena form" do
    render

    assert_select "form[action=?][method=?]", arena_path(@arena), "post" do

      assert_select "input[name=?]", "arena[arena_name]"

      assert_select "textarea[name=?]", "arena[arena_description]"
    end
  end
end
