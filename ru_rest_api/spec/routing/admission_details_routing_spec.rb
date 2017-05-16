require "rails_helper"

RSpec.describe AdmissionDetailsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/admission_details").to route_to("admission_details#index")
    end


    it "routes to #show" do
      expect(:get => "/admission_details/1").to route_to("admission_details#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/admission_details").to route_to("admission_details#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/admission_details/1").to route_to("admission_details#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/admission_details/1").to route_to("admission_details#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/admission_details/1").to route_to("admission_details#destroy", :id => "1")
    end

  end
end
