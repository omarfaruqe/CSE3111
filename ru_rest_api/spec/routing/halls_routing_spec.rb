require "rails_helper"

RSpec.describe HallsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/halls").to route_to("halls#index")
    end


    it "routes to #show" do
      expect(:get => "/halls/1").to route_to("halls#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/halls").to route_to("halls#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/halls/1").to route_to("halls#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/halls/1").to route_to("halls#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/halls/1").to route_to("halls#destroy", :id => "1")
    end

  end
end
