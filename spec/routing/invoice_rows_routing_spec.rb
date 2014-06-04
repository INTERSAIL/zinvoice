require "spec_helper"

describe InvoiceRowsController do
  describe "routing" do

    it "routes to #index" do
      get("/invoice_rows").should route_to("invoice_rows#index")
    end

    it "routes to #new" do
      get("/invoice_rows/new").should route_to("invoice_rows#new")
    end

    it "routes to #show" do
      get("/invoice_rows/1").should route_to("invoice_rows#show", :id => "1")
    end

    it "routes to #edit" do
      get("/invoice_rows/1/edit").should route_to("invoice_rows#edit", :id => "1")
    end

    it "routes to #create" do
      post("/invoice_rows").should route_to("invoice_rows#create")
    end

    it "routes to #update" do
      put("/invoice_rows/1").should route_to("invoice_rows#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/invoice_rows/1").should route_to("invoice_rows#destroy", :id => "1")
    end

  end
end
