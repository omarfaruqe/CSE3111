require "rails_helper"

RSpec.describe InformationController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/information").to route_to("information#index")
    end


    it "routes to #show" do
      expect(:get => "/information/1").to route_to("information#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/information").to route_to("information#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/information/1").to route_to("information#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/information/1").to route_to("information#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/information/1").to route_to("information#destroy", :id => "1")
    end

  end
end
