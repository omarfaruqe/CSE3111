require "rails_helper"

RSpec.describe ImportantDateApisController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/important_date_apis").to route_to("important_date_apis#index")
    end


    it "routes to #show" do
      expect(:get => "/important_date_apis/1").to route_to("important_date_apis#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/important_date_apis").to route_to("important_date_apis#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/important_date_apis/1").to route_to("important_date_apis#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/important_date_apis/1").to route_to("important_date_apis#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/important_date_apis/1").to route_to("important_date_apis#destroy", :id => "1")
    end

  end
end
