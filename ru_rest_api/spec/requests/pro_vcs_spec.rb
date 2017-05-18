require 'rails_helper'

RSpec.describe "ProVcs", type: :request do
  describe "GET /pro_vcs" do
    it "works! (now write some real specs)" do
      get pro_vcs_path
      expect(response).to have_http_status(200)
    end
  end
end
