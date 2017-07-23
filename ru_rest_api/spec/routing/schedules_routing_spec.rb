require "rails_helper"

RSpec.describe SchedulesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/schedules").to route_to("schedules#index")
    end


    it "routes to #show" do
      expect(:get => "/schedules/1").to route_to("schedules#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/schedules").to route_to("schedules#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/schedules/1").to route_to("schedules#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/schedules/1").to route_to("schedules#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/schedules/1").to route_to("schedules#destroy", :id => "1")
    end

  end
end
