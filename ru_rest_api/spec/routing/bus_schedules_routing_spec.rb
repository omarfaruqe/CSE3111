require "rails_helper"

RSpec.describe BusSchedulesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/bus_schedules").to route_to("bus_schedules#index")
    end


    it "routes to #show" do
      expect(:get => "/bus_schedules/1").to route_to("bus_schedules#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/bus_schedules").to route_to("bus_schedules#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/bus_schedules/1").to route_to("bus_schedules#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/bus_schedules/1").to route_to("bus_schedules#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/bus_schedules/1").to route_to("bus_schedules#destroy", :id => "1")
    end

  end
end
