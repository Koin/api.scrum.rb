require "spec_helper"
describe SprintBacklogsController do

  describe "GET #index" do
    it "responds successfully with an HTTP 200 status code" do
      sprint = FactoryGirl.create :sprint
      get :index, :product_id => sprint.product_id, :sprint_id => sprint.id
      response.should be_success
      response.code.should eq "200"
    end
  end

  describe "POST #create" do
    it "responds successfully with an HTTP 201 status code" do
      sprint = FactoryGirl.create :sprint
      product = sprint.product
      story = product.stories.new
      story.save
      post :create, :product_id => product.id, :sprint_id => sprint.id, :id => story.id
      response.should be_success
      response.code.should eq "201"
    end
    it "responds with a 422 status code if a story is already associated to a backlog" do
      sprint = FactoryGirl.create :sprint
      product = sprint.product
      story = product.stories.new
      story.save
      sprint.sprint_backlogs.new(story_id: story.id).save
      post :create, :product_id => product.id, :sprint_id => sprint.id, :id => story.id
      response.should_not be_success
      response.code.should eq "422"
    end
  end

  describe "PATCH #update" do
    it "responds successfully with an HTTP 204 status code" do
      sprint = FactoryGirl.create :sprint
      product = sprint.product
      story = product.stories.new
      story.save
      sprint.sprint_backlogs.new(story_id: story.id).save
      patch :update, :product_id => product.id, :sprint_id => sprint.id, :id => story.id
      response.should be_success
      response.code.should eq "204"
    end
    it "responds with a 404 status code if the product doesn't exist" do
      sprint = FactoryGirl.create :sprint
      product = sprint.product
      story = product.stories.new
      story.save
      patch :update, :product_id => product.id, :sprint_id => sprint.id, :id => story.id
      response.should_not be_success
      response.code.should eq "404"
    end
  end

  describe "DELETE #destroy" do
    it "responds successfully with an HTTP 204 status code" do
      sprint = FactoryGirl.create :sprint
      product = sprint.product
      story = product.stories.new
      story.save
      sprint.sprint_backlogs.new(story_id: story.id).save
      delete :destroy, :product_id => product.id, :sprint_id => sprint.id, :id => story.id
      response.should be_success
      response.code.should eq "204"
    end
  end
end
