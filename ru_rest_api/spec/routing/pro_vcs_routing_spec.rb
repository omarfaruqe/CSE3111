require "rails_helper"

RSpec.describe ProVcsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/pro_vcs").to route_to("pro_vcs#index")
    end


    it "routes to #show" do
      expect(:get => "/pro_vcs/1").to route_to("pro_vcs#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/pro_vcs").to route_to("pro_vcs#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/pro_vcs/1").to route_to("pro_vcs#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/pro_vcs/1").to route_to("pro_vcs#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/pro_vcs/1").to route_to("pro_vcs#destroy", :id => "1")
    end

  end
end
