require 'rails_helper'

RSpec.describe "Combats", type: :request do
  describe "GET /combats/:id" do
    let(:body) { response.body }

    it "shows a result" do
      combat = create :combat
      get combat_path(combat.run)
      expect(response).to have_http_status(200)
      expect(body).to match(%r{player_name_\d+ won})
      assert_select 'tbody>tr:last-child>td:last-child', text: 'dead'
    end
  end
end
