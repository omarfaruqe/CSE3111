require "rails_helper"

RSpec.describe VcsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/vcs").to route_to("vcs#index")
    end


    it "routes to #show" do
      expect(:get => "/vcs/1").to route_to("vcs#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/vcs").to route_to("vcs#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/vcs/1").to route_to("vcs#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/vcs/1").to route_to("vcs#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/vcs/1").to route_to("vcs#destroy", :id => "1")
    end

  end
end
