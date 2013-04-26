require "spec_helper"

describe SprintBacklogsController do
  describe "routing" do

    it "routes to #index" do
      get("/sprint_backlogs").should route_to("sprint_backlogs#index")
    end

    it "routes to #new" do
      get("/sprint_backlogs/new").should route_to("sprint_backlogs#new")
    end

    it "routes to #show" do
      get("/sprint_backlogs/1").should route_to("sprint_backlogs#show", :id => "1")
    end

    it "routes to #edit" do
      get("/sprint_backlogs/1/edit").should route_to("sprint_backlogs#edit", :id => "1")
    end

    it "routes to #create" do
      post("/sprint_backlogs").should route_to("sprint_backlogs#create")
    end

    it "routes to #update" do
      put("/sprint_backlogs/1").should route_to("sprint_backlogs#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/sprint_backlogs/1").should route_to("sprint_backlogs#destroy", :id => "1")
    end

  end
end
