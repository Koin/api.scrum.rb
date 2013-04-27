require "spec_helper"
describe TasksController do

  before(:each) do
    @product = FactoryGirl.create :product_with_stories_and_sprints
    @sprint = @product.sprints.first
    @story = @product.stories.first
    @backlog_story = @sprint.sprint_backlogs.new(story_id: @story.id)
    @backlog_story.save
  end

  describe "GET #index" do
    it "responds successfully with an HTTP 200 status code" do
      get :index, :product_id => @product.id, :sprint_id => @sprint.id, :story_id => @story.id
      response.should be_success
      response.code.should eq "200"
    end
  end

  describe "POST #create" do
    it "responds successfully with an HTTP 201 status code" do
      post :create, :product_id => @product.id, :sprint_id => @sprint.id, :story_id => @story.id, :task => { :label => "My super simple task" }
      response.should be_success
      response.code.should eq "201"
    end
    it "responds with a 422 status code if the label is empty" do
      post :create, :product_id => @product.id, :sprint_id => @sprint.id, :story_id => @story.id, :task => { :label => "" }
      response.should_not be_success
      response.code.should eq "422"
    end
  end

  describe "PATCH #update" do
    it "responds successfully with an HTTP 204 status code" do
      task = @backlog_story.tasks.new(:label => "My task")
      task.save
      patch :update, :product_id => @product.id, :sprint_id => @sprint.id, :story_id => @story.id, :id => task.id, :task => { :label => "My not so simple task :(" }
      response.should be_success
      response.code.should eq "204"
    end
    it "responds with a 404 status code if the task doesn't exist" do
      patch :update, :product_id => @product.id, :sprint_id => @sprint.id, :story_id => @story.id, :id => 7777
      response.should_not be_success
      response.code.should eq "404"
    end
  end

  describe "DELETE #destroy" do
    it "responds successfully with an HTTP 204 status code" do
      task = @backlog_story.tasks.new(:label => "My task")
      task.save
      delete :destroy, :product_id => @product.id, :sprint_id => @sprint.id, :story_id => @story.id, :id => task.id
      response.should be_success
      response.code.should eq "204"
    end
  end
end
