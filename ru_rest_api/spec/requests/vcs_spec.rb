require 'rails_helper'

RSpec.describe "Vcs", type: :request do
  describe "GET /vcs" do
    it "works! (now write some real specs)" do
      get vcs_path
      expect(response).to have_http_status(200)
    end
  end
end
