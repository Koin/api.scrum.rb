require 'spec_helper'
describe StoriesController do

  render_views

  describe "GET #index" do
    it "responds successfully with an HTTP 200 status code and ordered elements" do
      FactoryGirl.create :product_with_stories
      get :index
      response.should be_success
      response.code.should eq "200"
      previous_order = 0
      JSON.parse(response.body).each do |s|
        s["order"].to_i.should be >= previous_order, "Stories are not sorted correctly"
        previous_order = s["order"]
      end
    end
  end

  describe "GET #show" do
    it "responds successfully with an HTTP 200 status code" do
      product = FactoryGirl.create :product_with_stories
      story = product.stories.first
      get :show, :id => story.id
      response.should be_success
      response.code.should eq "200"
    end
    it "responds with a 404 status code if the story doesn't exist" do
      get :show, :id => -1
      response.should_not be_success
      response.code.should eq "404"
    end
  end

  describe "POST #create" do
    it "responds successfully with an HTTP 201 status code" do
      product = FactoryGirl.create :product
      post :create, :story => { :label => "My awesome story", :product_id => product.id }
      response.should be_success
      response.code.should eq "201"
    end
    it "responds with a 422 status code if the label is empty" do
      product = FactoryGirl.create :product
      post :create, :story => { :label => "", :product_id => product.id }
      response.should_not be_success
      response.code.should eq "422"
    end
    it "responds with a 422 status code if the technical point is not a number" do
      product = FactoryGirl.create :product
      post :create, :story => { :label => "My awesome story", :technical_point => "little", :product_id => product.id }
      response.should_not be_success
      response.code.should eq "422"
    end
    it "responds with a 422 status code if the functional point is not a number" do
      product = FactoryGirl.create :product
      post :create, :story => { :label => "My awesome story", :functional_point => "big", :product_id => product.id }
      response.should_not be_success
      response.code.should eq "422"
    end
  end

  describe "PATCH #update" do
    it "responds successfully with an HTTP 204 status code" do
      product = FactoryGirl.create :product_with_stories
      story = product.stories.first
      patch :update, :id => story.id, :story => { :label => "My awesome story" }
      response.should be_success
      response.code.should eq "204"
    end
    it "responds with a 422 status code if the technical point is not a number" do
      product = FactoryGirl.create :product_with_stories
      story = product.stories.first
      patch :update, :id => story.id, :story => { :label => "My awesome story", :technical_point => "little" }
      response.should_not be_success
      response.code.should eq "422"
    end
    it "responds with a 422 status code if the functional point is not a number" do
      product = FactoryGirl.create :product_with_stories
      story = product.stories.first
      patch :update, :id => story.id, :story => { :label => "My awesome story", :functional_point => "big" }
      response.should_not be_success
      response.code.should eq "422"
    end
    it "responds with a 404 status code if the story doesn't exist" do
      patch :update, :id => -1, :story => { :label => "My unknown story" }
      response.should_not be_success
      response.code.should eq "404"
    end
  end

  describe "DELETE #destroy" do
    it "responds successfully with an HTTP 204 status code" do
      product = FactoryGirl.create :product_with_stories
      story = product.stories.first
      delete :destroy, :id => story.id
      response.should be_success
      response.code.should eq "204"
    end
    it "responds with a 404 status code if the story doesn't exist" do
      delete :destroy, :id => -1
      response.should_not be_success
      response.code.should eq "404"
    end
  end
end
