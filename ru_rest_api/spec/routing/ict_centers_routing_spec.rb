require "rails_helper"

RSpec.describe IctCentersController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/ict_centers").to route_to("ict_centers#index")
    end


    it "routes to #show" do
      expect(:get => "/ict_centers/1").to route_to("ict_centers#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/ict_centers").to route_to("ict_centers#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/ict_centers/1").to route_to("ict_centers#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/ict_centers/1").to route_to("ict_centers#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/ict_centers/1").to route_to("ict_centers#destroy", :id => "1")
    end

  end
end
