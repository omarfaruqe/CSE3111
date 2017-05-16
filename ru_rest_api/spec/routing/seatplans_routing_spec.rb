require "rails_helper"

RSpec.describe SeatplansController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/seatplans").to route_to("seatplans#index")
    end


    it "routes to #show" do
      expect(:get => "/seatplans/1").to route_to("seatplans#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/seatplans").to route_to("seatplans#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/seatplans/1").to route_to("seatplans#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/seatplans/1").to route_to("seatplans#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/seatplans/1").to route_to("seatplans#destroy", :id => "1")
    end

  end
end
