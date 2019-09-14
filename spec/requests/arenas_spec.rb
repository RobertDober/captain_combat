require 'rails_helper'

RSpec.describe "Arenas", type: :request do
  describe "GET /arenas" do
    it "works! (now write some real specs)" do
      get arenas_path
      expect(response).to have_http_status(200)
    end
  end
end
