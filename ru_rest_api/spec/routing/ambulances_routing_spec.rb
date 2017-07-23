require "rails_helper"

RSpec.describe AmbulancesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/ambulances").to route_to("ambulances#index")
    end


    it "routes to #show" do
      expect(:get => "/ambulances/1").to route_to("ambulances#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/ambulances").to route_to("ambulances#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/ambulances/1").to route_to("ambulances#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/ambulances/1").to route_to("ambulances#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/ambulances/1").to route_to("ambulances#destroy", :id => "1")
    end

  end
end
