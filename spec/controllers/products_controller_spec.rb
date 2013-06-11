require "spec_helper"
describe ProductsController do

  render_views

  describe "GET #index" do
    it "responds successfully with an HTTP 200 status code" do
      FactoryGirl.create_list :product, 10
      get :index
      response.should be_success
      response.code.should eq "200"
    end
  end

  describe "GET #show" do
    it "responds successfully with an HTTP 200 status code" do
      product = FactoryGirl.create :product
      get :show, :id => product.id
      response.should be_success
      response.code.should eq "200"
    end
    it "responds with a 404 status code if the product doesn't exist" do
      get :show, :id => -1
      response.should_not be_success
      response.code.should eq "404"
    end
  end

  describe "POST #create" do
    it "responds successfully with an HTTP 201 status code" do
      post :create, :product => { :label => "My awesome project" }
      response.should be_success
      response.code.should eq "201"
    end
    it "responds with a 422 status code if the label is empty" do
      post :create, :product => { :label => "" }
      response.should_not be_success
      response.code.should eq "422"
    end
  end

  describe "PATCH #update" do
    it "responds successfully with an HTTP 204 status code" do
      product = FactoryGirl.create :product
      patch :update, :id => product.id, :product => { :label => "My awesome project" }
      response.should be_success
      response.code.should eq "204"
    end
    it "responds with a 404 status code if the product doesn't exist" do
      patch :update, :id => -1, :product => { :label => "My unknown project" }
      response.should_not be_success
      response.code.should eq "404"
    end
  end

  describe "DELETE #destroy" do
    it "responds successfully with an HTTP 204 status code" do
      product = FactoryGirl.create :product
      delete :destroy, :id => product.id
      response.should be_success
      response.code.should eq "204"
    end
    it "responds with a 404 status code if the product doesn't exist" do
      delete :destroy, :id => -1
      response.should_not be_success
      response.code.should eq "404"
    end
  end
end
