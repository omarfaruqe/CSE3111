require 'rails_helper'

RSpec.describe "Accomodations", type: :request do
  describe "GET /accomodations" do
    it "works! (now write some real specs)" do
      get accomodations_path
      expect(response).to have_http_status(200)
    end
  end
end
