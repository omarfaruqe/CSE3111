require 'rails_helper'

RSpec.describe "Diagonises", type: :request do
  describe "GET /diagonises" do
    it "works! (now write some real specs)" do
      get diagonises_path
      expect(response).to have_http_status(200)
    end
  end
end
