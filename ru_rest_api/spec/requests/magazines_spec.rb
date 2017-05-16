require 'rails_helper'

RSpec.describe "Magazines", type: :request do
  describe "GET /magazines" do
    it "works! (now write some real specs)" do
      get magazines_path
      expect(response).to have_http_status(200)
    end
  end
end
