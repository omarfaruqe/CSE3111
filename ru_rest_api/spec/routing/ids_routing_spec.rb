require "rails_helper"

RSpec.describe IdsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/ids").to route_to("ids#index")
    end


    it "routes to #show" do
      expect(:get => "/ids/1").to route_to("ids#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/ids").to route_to("ids#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/ids/1").to route_to("ids#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/ids/1").to route_to("ids#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/ids/1").to route_to("ids#destroy", :id => "1")
    end

  end
end
