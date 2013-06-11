require 'spec_helper'
describe SprintsController do

  render_views

  describe "GET #index" do
    it "responds successfully with an HTTP 200 status code" do
      FactoryGirl.create :product_with_sprints
      get :index
      response.should be_success
      response.code.should eq "200"
    end
  end

  describe "GET #show" do
    it "responds successfully with an HTTP 200 status code" do
      product = FactoryGirl.create :product_with_sprints
      sprint = product.sprints.first
      get :show, :id => sprint.id
      response.should be_success
      response.code.should eq "200"
    end
    it "responds with a 404 status code if the sprint doesn't exist" do
      get :show, :id => -1
      response.should_not be_success
      response.code.should eq "404"
    end
  end

  describe "POST #create" do
    it "responds successfully with an HTTP 201 status code" do
      product = FactoryGirl.create :product
      post :create, :sprint => { :start_date => Time.now, :end_date => 15.days.since, :product_id => product.id }
      response.should be_success
      response.code.should eq "201"
    end
    it "responds with a 422 status code if the start date is not a date" do
      product = FactoryGirl.create :product
      post :create, :sprint => { :start_date => "", :product_id => product.id }
      response.should_not be_success
      response.code.should eq "422"
    end
    it "responds with a 422 status code if the end date is not a date" do
      product = FactoryGirl.create :product
      post :create, :sprint => { :start_date => Time.now, :end_date => "", :product_id => product.id }
      response.should_not be_success
      response.code.should eq "422"
    end
    it "responds with a 422 status code if the end date is before the start date" do
      product = FactoryGirl.create :product
      post :create, :sprint => { :start_date => Time.now, :end_date => 1.days.ago, :product_id => product.id }
      response.should_not be_success
      response.code.should eq "422"
    end
  end

  describe "PATCH #update" do
    it "responds successfully with an HTTP 204 status code" do
      product = FactoryGirl.create :product_with_sprints
      sprint = product.sprints.first
      patch :update, :id => sprint.id, :sprint => { :start_date => Time.now, :end_date => 15.days.since }
      response.should be_success
      response.code.should eq "204"
    end
    it "responds with a 404 status code if the sprint doesn't exist" do
      patch :update, :id => -1, :sprint => { :start_date => Time.now, :end_date => 15.days.since }
      response.should_not be_success
      response.code.should eq "404"
    end
    it "responds with a 422 status code if the start date is not a date" do
      product = FactoryGirl.create :product_with_sprints
      sprint = product.sprints.first
      patch :update, :id => sprint.id, :sprint => { :start_date => "" }
      response.should_not be_success
      response.code.should eq "422"
    end
    it "responds with a 422 status code if the end date is not a date" do
      product = FactoryGirl.create :product_with_sprints
      sprint = product.sprints.first
      patch :update, :id => sprint.id, :sprint => { :start_date => Time.now, :end_date => "" }
      response.should_not be_success
      response.code.should eq "422"
    end
    it "responds with a 422 status code if the end date is before the start date" do
      product = FactoryGirl.create :product_with_sprints
      sprint = product.sprints.first
      patch :update, :id => sprint.id, :sprint => { :start_date => Time.now, :end_date => 1.days.ago }
      response.should_not be_success
      response.code.should eq "422"
    end
  end

  describe "DELETE #destroy" do
    it "responds successfully with an HTTP 204 status code" do
      product = FactoryGirl.create :product_with_sprints
      sprint = product.sprints.first
      delete :destroy, :id => sprint.id
      response.should be_success
      response.code.should eq "204"
    end
    it "responds with a 404 status code if the sprint doesn't exist" do
      delete :destroy, :id => -1
      response.should_not be_success
      response.code.should eq "404"
    end
  end

end
