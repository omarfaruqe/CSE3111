require "rails_helper"

RSpec.describe DigitalidsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/digitalids").to route_to("digitalids#index")
    end


    it "routes to #show" do
      expect(:get => "/digitalids/1").to route_to("digitalids#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/digitalids").to route_to("digitalids#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/digitalids/1").to route_to("digitalids#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/digitalids/1").to route_to("digitalids#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/digitalids/1").to route_to("digitalids#destroy", :id => "1")
    end

  end
end
