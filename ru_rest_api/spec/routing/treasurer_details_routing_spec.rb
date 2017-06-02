require "rails_helper"

RSpec.describe TreasurerDetailsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/treasurer_details").to route_to("treasurer_details#index")
    end


    it "routes to #show" do
      expect(:get => "/treasurer_details/1").to route_to("treasurer_details#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/treasurer_details").to route_to("treasurer_details#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/treasurer_details/1").to route_to("treasurer_details#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/treasurer_details/1").to route_to("treasurer_details#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/treasurer_details/1").to route_to("treasurer_details#destroy", :id => "1")
    end

  end
end
