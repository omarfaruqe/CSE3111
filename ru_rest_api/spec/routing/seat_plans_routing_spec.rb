require "rails_helper"

RSpec.describe SeatPlansController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/seat_plans").to route_to("seat_plans#index")
    end


    it "routes to #show" do
      expect(:get => "/seat_plans/1").to route_to("seat_plans#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/seat_plans").to route_to("seat_plans#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/seat_plans/1").to route_to("seat_plans#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/seat_plans/1").to route_to("seat_plans#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/seat_plans/1").to route_to("seat_plans#destroy", :id => "1")
    end

  end
end
