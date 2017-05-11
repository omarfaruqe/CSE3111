require "rails_helper"

RSpec.describe HolidaysController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/holidays").to route_to("holidays#index")
    end


    it "routes to #show" do
      expect(:get => "/holidays/1").to route_to("holidays#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/holidays").to route_to("holidays#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/holidays/1").to route_to("holidays#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/holidays/1").to route_to("holidays#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/holidays/1").to route_to("holidays#destroy", :id => "1")
    end

  end
end
