module Backlog
  class TasksController < ApiController
    before_action :set_product
    before_action :set_sprint
    before_action :set_backlog_sprint
    before_action :set_task, only: [:show, :update, :destroy]

    # GET /products/1/sprints/1/backlog/stories/1/tasks
    # GET /products/1/sprints/1/backlog/stories/1/tasks.json
    def index
      @tasks = @sprint_backlog.tasks.to_a
    end

    # GET /products/1/sprints/1/backlog/stories/1/tasks/1
    # GET /products/1/sprints/1/backlog/stories/1/tasks/1.json
    def show
    end

    # POST /products/1/sprints/1/backlog/stories/1/tasks
    # POST /products/1/sprints/1/backlog/stories/1/tasks.json
    def create
      @task = @sprint_backlog.tasks.new(task_params)
      if @task.save
        render action: 'show', status: :created, location: product_sprint_backlog_story_url(@product, @sprint, @sprint_backlog, @task, format: :json)
      else
        render json: { errors: @task.errors }, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /products/1/sprints/1/backlog/stories/1/tasks/1
    # PATCH/PUT /products/1/sprints/1/backlog/stories/1/tasks/1.json
    def update
      return render json: { }, status: :not_found if @task.nil?
      if @task.update(task_params)
        head :no_content
      else
        render json: { errors: @task.errors }, status: :unprocessable_entity
      end
    end

    # DELETE /products/1/sprints/1/backlog/stories/1/tasks/1
    # DELETE /products/1/sprints/1/backlog/stories/1/tasks/1.json
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

      def set_backlog_sprint
        @sprint_backlog = @sprint.sprint_backlogs.find(params[:story_id])
      end
  end
end
