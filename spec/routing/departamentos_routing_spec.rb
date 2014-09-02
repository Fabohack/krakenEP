require "spec_helper"

describe DepartamentosController do
  describe "routing" do

    it "routes to #index" do
      get("/departamentos").should route_to("departamentos#index")
    end

    it "routes to #new" do
      get("/departamentos/new").should route_to("departamentos#new")
    end

    it "routes to #show" do
      get("/departamentos/1").should route_to("departamentos#show", :id => "1")
    end

    it "routes to #edit" do
      get("/departamentos/1/edit").should route_to("departamentos#edit", :id => "1")
    end

    it "routes to #create" do
      post("/departamentos").should route_to("departamentos#create")
    end

    it "routes to #update" do
      put("/departamentos/1").should route_to("departamentos#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/departamentos/1").should route_to("departamentos#destroy", :id => "1")
    end

  end
end
