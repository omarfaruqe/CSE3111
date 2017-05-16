require 'rails_helper'

RSpec.describe "Accommodations", type: :request do
  describe "GET /accommodations" do
    it "works! (now write some real specs)" do
      get accommodations_path
      expect(response).to have_http_status(200)
    end
  end
end
