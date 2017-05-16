require "rails_helper"

RSpec.describe MagazinesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/magazines").to route_to("magazines#index")
    end


    it "routes to #show" do
      expect(:get => "/magazines/1").to route_to("magazines#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/magazines").to route_to("magazines#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/magazines/1").to route_to("magazines#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/magazines/1").to route_to("magazines#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/magazines/1").to route_to("magazines#destroy", :id => "1")
    end

  end
end
