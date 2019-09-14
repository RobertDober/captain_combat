require "rails_helper"

RSpec.describe ArenasController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/arenas").to route_to("arenas#index")
    end

    it "routes to #new" do
      expect(:get => "/arenas/new").to route_to("arenas#new")
    end

    it "routes to #show" do
      expect(:get => "/arenas/1").to route_to("arenas#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/arenas/1/edit").to route_to("arenas#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/arenas").to route_to("arenas#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/arenas/1").to route_to("arenas#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/arenas/1").to route_to("arenas#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/arenas/1").to route_to("arenas#destroy", :id => "1")
    end
  end
end
