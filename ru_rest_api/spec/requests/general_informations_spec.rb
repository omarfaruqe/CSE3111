require 'rails_helper'

RSpec.describe "GeneralInformations", type: :request do
  describe "GET /general_informations" do
    it "works! (now write some real specs)" do
      get general_informations_path
      expect(response).to have_http_status(200)
    end
  end
end
