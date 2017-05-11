require "rails_helper"

RSpec.describe CertificatesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/certificates").to route_to("certificates#index")
    end


    it "routes to #show" do
      expect(:get => "/certificates/1").to route_to("certificates#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/certificates").to route_to("certificates#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/certificates/1").to route_to("certificates#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/certificates/1").to route_to("certificates#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/certificates/1").to route_to("certificates#destroy", :id => "1")
    end

  end
end
