require "rails_helper"

RSpec.describe GeneralInformationsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/general_informations").to route_to("general_informations#index")
    end


    it "routes to #show" do
      expect(:get => "/general_informations/1").to route_to("general_informations#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/general_informations").to route_to("general_informations#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/general_informations/1").to route_to("general_informations#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/general_informations/1").to route_to("general_informations#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/general_informations/1").to route_to("general_informations#destroy", :id => "1")
    end

  end
end
