require "rails_helper"

RSpec.describe DiagonisesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/diagonises").to route_to("diagonises#index")
    end


    it "routes to #show" do
      expect(:get => "/diagonises/1").to route_to("diagonises#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/diagonises").to route_to("diagonises#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/diagonises/1").to route_to("diagonises#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/diagonises/1").to route_to("diagonises#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/diagonises/1").to route_to("diagonises#destroy", :id => "1")
    end

  end
end
