require 'rails_helper'

RSpec.describe "Ids", type: :request do
  describe "GET /ids" do
    it "works! (now write some real specs)" do
      get ids_path
      expect(response).to have_http_status(200)
    end
  end
end
