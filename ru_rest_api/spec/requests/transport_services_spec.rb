require 'rails_helper'

RSpec.describe "TransportServices", type: :request do
  describe "GET /transport_services" do
    it "works! (now write some real specs)" do
      get transport_services_path
      expect(response).to have_http_status(200)
    end
  end
end
