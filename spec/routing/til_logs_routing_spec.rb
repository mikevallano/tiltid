require "rails_helper"

RSpec.describe TilLogsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/til_logs").to route_to("til_logs#index")
    end

    it "routes to #new" do
      expect(:get => "/til_logs/new").to route_to("til_logs#new")
    end

    it "routes to #show" do
      expect(:get => "/til_logs/1").to route_to("til_logs#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/til_logs/1/edit").to route_to("til_logs#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/til_logs").to route_to("til_logs#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/til_logs/1").to route_to("til_logs#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/til_logs/1").to route_to("til_logs#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/til_logs/1").to route_to("til_logs#destroy", :id => "1")
    end
  end
end
