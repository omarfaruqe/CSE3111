require "rails_helper"

RSpec.describe TeachersQuartersController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/teachers_quarters").to route_to("teachers_quarters#index")
    end


    it "routes to #show" do
      expect(:get => "/teachers_quarters/1").to route_to("teachers_quarters#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/teachers_quarters").to route_to("teachers_quarters#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/teachers_quarters/1").to route_to("teachers_quarters#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/teachers_quarters/1").to route_to("teachers_quarters#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/teachers_quarters/1").to route_to("teachers_quarters#destroy", :id => "1")
    end

  end
end
