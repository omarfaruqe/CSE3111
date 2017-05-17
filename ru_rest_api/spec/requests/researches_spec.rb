require 'rails_helper'

RSpec.describe "Researches", type: :request do
  describe "GET /researches" do
    it "works! (now write some real specs)" do
      get researches_path
      expect(response).to have_http_status(200)
    end
  end
end

RSpec.describe "ResearchesPost", type: :request do
  describe "POST/researches" do

    it "Valid testing" do
      get researches_path
      expect(Research.new(name: 'Omar Faruk',topic: 'BigData')).to be_valid
    end
    it "invalid testing" do
      get researches_path
      expect(Research.new(name: null,topic:null )).to be_valid
    end
    it "invalid testing" do
      get researches_path
      expect(name:null,topic:'Bigdata').to be_valid
    end
    it "invalid testing" do
      get researches_path do
        expect(Research.new(name: 'Omar Faruk',topic:null)).to be valid
      end
    end
  end
end