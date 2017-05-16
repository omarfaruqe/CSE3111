require 'rails_helper'

RSpec.describe "IctCenters", type: :request do
  describe "GET /ict_centers" do
    it "works! (now write some real specs)" do
      get ict_centers_path
      expect(response).to have_http_status(200)
    end
  end
end
