require "rails_helper"

RSpec.describe JournalsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/journals").to route_to("journals#index")
    end


    it "routes to #show" do
      expect(:get => "/journals/1").to route_to("journals#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/journals").to route_to("journals#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/journals/1").to route_to("journals#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/journals/1").to route_to("journals#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/journals/1").to route_to("journals#destroy", :id => "1")
    end

  end
end
