require 'rails_helper'

RSpec.describe "ImportantDateApis", type: :request do
  describe "GET /important_date_apis" do
    it "works! (now write some real specs)" do
      get important_date_apis_path
      expect(response).to have_http_status(200)
    end
  end
end
