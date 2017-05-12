require 'rails_helper'

RSpec.describe "Dormitories", type: :request do
  describe "GET /dormitories" do
    it "works! (now write some real specs)" do
      get dormitories_path
      expect(response).to have_http_status(200)
    end
  end
end
