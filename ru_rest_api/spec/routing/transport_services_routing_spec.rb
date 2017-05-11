require "rails_helper"

RSpec.describe TransportServicesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/transport_services").to route_to("transport_services#index")
    end


    it "routes to #show" do
      expect(:get => "/transport_services/1").to route_to("transport_services#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/transport_services").to route_to("transport_services#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/transport_services/1").to route_to("transport_services#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/transport_services/1").to route_to("transport_services#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/transport_services/1").to route_to("transport_services#destroy", :id => "1")
    end

  end
end
