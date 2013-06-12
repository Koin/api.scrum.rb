require "spec_helper"
describe TasksController do

  render_views

  before(:each) do
    @product = FactoryGirl.create :product_with_stories_and_sprints
    @sprint = @product.sprints.first
    @story = @product.stories.first
    @story_backlog = @sprint.sprint_backlogs.new(story_id: @story.id)
    @story_backlog.save
  end

  describe "GET #index" do
    it "responds successfully with an HTTP 200 status code" do
      task = @story_backlog.tasks.new(label: "My task")
      task.save
      get :index
      response.should be_success
      response.code.should eq "200"
    end
  end

  describe "GET #show" do
    it "responds successfully with an HTTP 200 status code" do
      task = @story_backlog.tasks.new(label: "My task")
      task.save
      get :show, :id => task.id
      response.should be_success
      response.code.should eq "200"
    end
    it "responds with a 404 status code if the task doesn't exist" do
      get :show, :id => -1
      response.should_not be_success
      response.code.should eq "404"
    end
  end

  describe "POST #create" do
    it "responds successfully with an HTTP 201 status code" do
      post :create, :task => { :label => "My task", :sprint_backlog_id => @story_backlog.id }
      response.should be_success
      response.code.should eq "201"
    end
    it "responds with a 422 status code if the label is empty" do
      post :create, :task => { :label => "", :sprint_backlog_id => @story_backlog.id }
      response.should_not be_success
      response.code.should eq "422"
    end
  end

  describe "PATCH #update" do
    it "responds successfully with an HTTP 204 status code" do
      task = @story_backlog.tasks.new(label: "My task")
      task.save
      patch :update, :id => task.id, :task => { :label => "My uber task" }
      response.should be_success
      response.code.should eq "204"
    end
    it "responds with a 404 status code if the task doesn't exist" do
      patch :update, :id => -1, :task => { }
      response.should_not be_success
      response.code.should eq "404"
    end
  end

  describe "DELETE #destroy" do
    it "responds successfully with an HTTP 204 status code" do
      task = @story_backlog.tasks.new(label: "My task")
      task.save
      delete :destroy, :id => task.id
      response.should be_success
      response.code.should eq "204"
    end
    it "responds with a 404 status code if the task doesn't exist" do
      delete :destroy, :id => -1
      response.should_not be_success
      response.code.should eq "404"
    end
  end
end
