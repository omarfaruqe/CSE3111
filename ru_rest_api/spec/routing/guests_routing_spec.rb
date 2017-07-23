require "rails_helper"

RSpec.describe GuestsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/guests").to route_to("guests#index")
    end


    it "routes to #show" do
      expect(:get => "/guests/1").to route_to("guests#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/guests").to route_to("guests#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/guests/1").to route_to("guests#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/guests/1").to route_to("guests#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/guests/1").to route_to("guests#destroy", :id => "1")
    end

  end
end
