require "spec_helper"

describe DescriptionsController do
  describe "routing" do

    it "routes to #index" do
      get("/descriptions").should route_to("descriptions#index")
    end

    it "routes to #new" do
      get("/descriptions/new").should route_to("descriptions#new")
    end

    it "routes to #show" do
      get("/descriptions/1").should route_to("descriptions#show", :id => "1")
    end

    it "routes to #edit" do
      get("/descriptions/1/edit").should route_to("descriptions#edit", :id => "1")
    end

    it "routes to #create" do
      post("/descriptions").should route_to("descriptions#create")
    end

    it "routes to #update" do
      put("/descriptions/1").should route_to("descriptions#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/descriptions/1").should route_to("descriptions#destroy", :id => "1")
    end

  end
end
