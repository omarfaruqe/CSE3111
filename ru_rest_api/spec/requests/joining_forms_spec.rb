require 'rails_helper'

RSpec.describe "JoiningForms", type: :request do
  describe "GET /joining_forms" do
    it "works! (now write some real specs)" do
      get joining_forms_path
      expect(response).to have_http_status(200)
    end
  end
end
