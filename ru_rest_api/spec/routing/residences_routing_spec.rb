require "rails_helper"

RSpec.describe ResidencesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/residences").to route_to("residences#index")
    end


    it "routes to #show" do
      expect(:get => "/residences/1").to route_to("residences#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/residences").to route_to("residences#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/residences/1").to route_to("residences#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/residences/1").to route_to("residences#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/residences/1").to route_to("residences#destroy", :id => "1")
    end

  end
end
