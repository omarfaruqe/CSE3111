require "rails_helper"

RSpec.describe DoctorsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/doctors").to route_to("doctors#index")
    end


    it "routes to #show" do
      expect(:get => "/doctors/1").to route_to("doctors#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/doctors").to route_to("doctors#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/doctors/1").to route_to("doctors#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/doctors/1").to route_to("doctors#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/doctors/1").to route_to("doctors#destroy", :id => "1")
    end

  end
end
