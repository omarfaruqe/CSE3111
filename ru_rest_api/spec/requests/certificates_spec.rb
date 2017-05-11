require 'rails_helper'

RSpec.describe "Certificates", type: :request do
  describe "GET /certificates" do
    it "works! (now write some real specs)" do
      get certificates_path
      expect(response).to have_http_status(200)
    end
  end
end
