require 'rails_helper'

RSpec.describe "Exams", type: :request do
  describe "GET /exams" do
    it "works! (now write some real specs)" do
      get exams_path
      expect(response).to have_http_status(200)
    end
  end
end
