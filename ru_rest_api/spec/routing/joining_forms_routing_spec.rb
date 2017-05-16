require "rails_helper"

RSpec.describe JoiningFormsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/joining_forms").to route_to("joining_forms#index")
    end


    it "routes to #show" do
      expect(:get => "/joining_forms/1").to route_to("joining_forms#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/joining_forms").to route_to("joining_forms#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/joining_forms/1").to route_to("joining_forms#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/joining_forms/1").to route_to("joining_forms#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/joining_forms/1").to route_to("joining_forms#destroy", :id => "1")
    end

  end
end
