require "rails_helper"

RSpec.describe ExamsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/exams").to route_to("exams#index")
    end

    it "routes to #new" do
      expect(:get => "/exams/new").to route_to("exams#new")
    end

    it "routes to #show" do
      expect(:get => "/exams/1").to route_to("exams#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/exams/1/edit").to route_to("exams#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/exams").to route_to("exams#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/exams/1").to route_to("exams#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/exams/1").to route_to("exams#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/exams/1").to route_to("exams#destroy", :id => "1")
    end

  end
end
