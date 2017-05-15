require 'rails_helper'

RSpec.describe "ExamInfos", type: :request do
  describe "GET /exam_infos" do
    it "works! (now write some real specs)" do
      get exam_infos_path
      expect(response).to have_http_status(200)
    end
  end
end
