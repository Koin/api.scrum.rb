require 'spec_helper'
describe SprintsController do

  describe "GET #index" do
    it "responds successfully with an HTTP 200 status code" do
      product = FactoryGirl.create :product
      get :index, :product_id => product.id
      response.should be_success
      response.code.should eq "200"
    end
  end

  describe "POST #create" do
    it "responds successfully with an HTTP 201 status code" do
      product = FactoryGirl.create :product
      post :create, :product_id => product.id, :sprint => { :start_date => Time.now, :end_date => 15.days.since }
      response.should be_success
      response.code.should eq "201"
    end
  end

  describe "PATCH #update" do
    it "responds successfully with an HTTP 204 status code" do
      sprint = FactoryGirl.create :sprint
      patch :update, :product_id => sprint.product_id, :id => sprint.id, :sprint => { :start_date => Time.now, :end_date => 15.days.since }
      response.should be_success
      response.code.should eq "204"
    end
    it "responds with a 404 status code if the sprint doesn't exist" do
      product = FactoryGirl.create :product
      patch :update, :product_id => product.id, :id => 7777, :sprint => { :start_date => Time.now, :end_date => 15.days.since }
      response.should_not be_success
      response.code.should eq "404"
    end
  end

  describe "DELETE #destroy" do
    it "responds successfully with an HTTP 204 status code" do
      sprint = FactoryGirl.create :sprint
      delete :destroy, :product_id => sprint.product_id, :id => sprint.id
      response.should be_success
      response.code.should eq "204"
    end
  end

end
