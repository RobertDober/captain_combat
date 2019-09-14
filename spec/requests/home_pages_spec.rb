require 'rails_helper'

RSpec.describe "HomePages", type: :request do
  describe "GET /home_pages" do
    it "shows the first Arena" do
      arena = create :arena
      get root_path
      expect(response).to have_http_status(200)
      expect(response.body).to match(arena.arena_description)
    end
  end
end
