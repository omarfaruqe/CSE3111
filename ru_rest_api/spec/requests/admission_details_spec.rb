require 'rails_helper'

RSpec.describe "AdmissionDetails", type: :request do
  describe "GET /admission_details" do
    it "works! (now write some real specs)" do
      get admission_details_path
      expect(response).to have_http_status(200)
    end
  end
end
