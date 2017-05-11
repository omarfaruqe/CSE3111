require "rails_helper"

RSpec.describe AccomodationsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/accomodations").to route_to("accomodations#index")
    end


    it "routes to #show" do
      expect(:get => "/accomodations/1").to route_to("accomodations#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/accomodations").to route_to("accomodations#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/accomodations/1").to route_to("accomodations#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/accomodations/1").to route_to("accomodations#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/accomodations/1").to route_to("accomodations#destroy", :id => "1")
    end

  end
end
