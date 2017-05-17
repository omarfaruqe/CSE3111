require "rails_helper"

RSpec.describe ResearchesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/researches").to route_to("researches#index")
    end


    it "routes to #show" do
      expect(:get => "/researches/1").to route_to("researches#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/researches").to route_to("researches#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/researches/1").to route_to("researches#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/researches/1").to route_to("researches#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/researches/1").to route_to("researches#destroy", :id => "1")
    end

  end
end
