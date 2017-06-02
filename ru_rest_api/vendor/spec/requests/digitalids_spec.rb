require 'rails_helper'

RSpec.describe "Digitalids", type: :request do
  describe "GET /digitalids" do
    it "works! (now write some real specs)" do
      get digitalids_path
      expect(response).to have_http_status(200)
    end
  end
end
