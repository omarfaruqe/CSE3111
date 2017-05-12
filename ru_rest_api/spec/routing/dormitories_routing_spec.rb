require "rails_helper"

RSpec.describe DormitoriesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/dormitories").to route_to("dormitories#index")
    end


    it "routes to #show" do
      expect(:get => "/dormitories/1").to route_to("dormitories#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/dormitories").to route_to("dormitories#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/dormitories/1").to route_to("dormitories#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/dormitories/1").to route_to("dormitories#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/dormitories/1").to route_to("dormitories#destroy", :id => "1")
    end

  end
end
