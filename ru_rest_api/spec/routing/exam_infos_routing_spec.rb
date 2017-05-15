require "rails_helper"

RSpec.describe ExamInfosController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/exam_infos").to route_to("exam_infos#index")
    end


    it "routes to #show" do
      expect(:get => "/exam_infos/1").to route_to("exam_infos#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/exam_infos").to route_to("exam_infos#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/exam_infos/1").to route_to("exam_infos#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/exam_infos/1").to route_to("exam_infos#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/exam_infos/1").to route_to("exam_infos#destroy", :id => "1")
    end

  end
end
