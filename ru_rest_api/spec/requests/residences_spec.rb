require 'rails_helper'

RSpec.describe "Residences", type: :request do
  describe "GET /residences" do
    it "works! (now write some real specs)" do
      get residences_path
      expect(response).to have_http_status(200)
    end
  end
end
