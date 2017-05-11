require "rails_helper"

RSpec.describe IctCentresController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/ict_centres").to route_to("ict_centres#index")
    end


    it "routes to #show" do
      expect(:get => "/ict_centres/1").to route_to("ict_centres#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/ict_centres").to route_to("ict_centres#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/ict_centres/1").to route_to("ict_centres#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/ict_centres/1").to route_to("ict_centres#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/ict_centres/1").to route_to("ict_centres#destroy", :id => "1")
    end

  end
end
