class TasksController < ApplicationController
  before_action :set_product
  before_action :set_sprint
  before_action :set_story
  before_action :set_sprint_backlog
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  # GET /tasks
  # GET /tasks.json
  def index
    @tasks = @sprint_backlog.tasks.to_a
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
  end

  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = @sprint_backlog.tasks.new(task_params)
    if @task.save
      render action: 'show', status: :created, location: product_sprint_story_task_url(@product, @sprint, @story, @task, format: :json)
    else
      render json: @task.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def update
    return render json: { }, status: :not_found if @task.nil?
    if @task.update(task_params)
      head :no_content
    else
      render json: @task.errors, status: :unprocessable_entity
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    return render json: { }, status: :not_found if @task.nil?
    @task.destroy
    head :no_content
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = @sprint_backlog.tasks.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:task).permit(:label, :description, :point, :state)
    end

    def set_product
      @product = Product.find(params[:product_id])
    end

    def set_sprint
      @sprint = @product.sprints.find(params[:sprint_id])
    end

    def set_story
      @story = @product.stories.find(params[:story_id])
    end

    def set_sprint_backlog
      @sprint_backlog = @sprint.sprint_backlogs.find_by_story_id(@story.id)
    end
end
