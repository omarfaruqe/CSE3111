require 'rails_helper'

RSpec.describe "Holidays", type: :request do
  describe "GET /holidays" do
    it "works! (now write some real specs)" do
      get holidays_path
      expect(response).to have_http_status(200)
    end
  end
end
