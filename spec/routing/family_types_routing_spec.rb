require "spec_helper"

describe FamilyTypesController do
  describe "routing" do

    it "routes to #index" do
      get("/family_types").should route_to("family_types#index")
    end

    it "routes to #new" do
      get("/family_types/new").should route_to("family_types#new")
    end

    it "routes to #show" do
      get("/family_types/1").should route_to("family_types#show", :id => "1")
    end

    it "routes to #edit" do
      get("/family_types/1/edit").should route_to("family_types#edit", :id => "1")
    end

    it "routes to #create" do
      post("/family_types").should route_to("family_types#create")
    end

    it "routes to #update" do
      put("/family_types/1").should route_to("family_types#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/family_types/1").should route_to("family_types#destroy", :id => "1")
    end

  end
end
