require "rails_helper"

RSpec.describe CombatsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/combats").to route_to("combats#index")
    end

    it "routes to #new" do
      expect(:get => "/combats/new").to route_to("combats#new")
    end

    it "routes to #show" do
      expect(:get => "/combats/1").to route_to("combats#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/combats/1/edit").to route_to("combats#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/combats").to route_to("combats#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/combats/1").to route_to("combats#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/combats/1").to route_to("combats#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/combats/1").to route_to("combats#destroy", :id => "1")
    end
  end
end
