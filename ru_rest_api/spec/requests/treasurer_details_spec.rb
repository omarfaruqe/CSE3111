require 'rails_helper'

RSpec.describe "TreasurerDetails", type: :request do
  describe "GET /treasurer_details" do
    it "works! (now write some real specs)" do
      get treasurer_details_path
      expect(response).to have_http_status(200)
    end
  end
end
