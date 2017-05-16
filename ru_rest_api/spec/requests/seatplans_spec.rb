require 'rails_helper'

RSpec.describe "Seatplans", type: :request do
  describe "GET /seatplans" do
    it "works! (now write some real specs)" do
      get seatplans_path
      expect(response).to have_http_status(200)
    end
  end
end
