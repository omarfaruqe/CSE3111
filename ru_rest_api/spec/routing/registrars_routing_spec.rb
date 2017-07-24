require "rails_helper"

RSpec.describe RegistrarsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/registrars").to route_to("registrars#index")
    end


    it "routes to #show" do
      expect(:get => "/registrars/1").to route_to("registrars#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/registrars").to route_to("registrars#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/registrars/1").to route_to("registrars#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/registrars/1").to route_to("registrars#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/registrars/1").to route_to("registrars#destroy", :id => "1")
    end

  end
end
