require "rails_helper"

RSpec.describe AccommodationsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/accommodations").to route_to("accommodations#index")
    end


    it "routes to #show" do
      expect(:get => "/accommodations/1").to route_to("accommodations#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/accommodations").to route_to("accommodations#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/accommodations/1").to route_to("accommodations#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/accommodations/1").to route_to("accommodations#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/accommodations/1").to route_to("accommodations#destroy", :id => "1")
    end

  end
end
