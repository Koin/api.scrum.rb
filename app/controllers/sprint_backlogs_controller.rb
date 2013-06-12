class SprintBacklogsController < ApiController
  before_action :set_sprint
  before_action :set_sprint_backlog, only: [:show, :update, :destroy]

  # GET /sprints/1/stories
  # GET /sprints/1/stories.json
  def index
    @sprint_backlogs = @sprint.sprint_backlogs.order(:order).to_a
  end

  # GET /sprints/1/stories/1
  # GET /sprints/1/stories/1.json
  def show
  end

  # POST /sprints/1/stories
  # POST /sprints/1/stories.json
  def create
    @sprint_backlog = @sprint.sprint_backlogs.new(backlog_params)
    if @sprint_backlog.save
      render action: 'show', status: :created, location: sprint_story_url(@sprint, @sprint_backlog, format: :json)
    else
      render json: { errors: @sprint_backlog.errors }, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /sprints/1/stories/1
  # PATCH/PUT /sprints/1/stories/1.json
  def update
    if @sprint_backlog.update(backlog_params)
      head :no_content
    else
      render json: { errors: @sprint_backlog.errors }, status: :unprocessable_entity
    end
  end

  # DELETE /sprints/1/stories/1
  # DELETE /sprints/1/stories/1.json
  def destroy
    @sprint_backlog.destroy
    head :no_content
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sprint_backlog
      @sprint_backlog = @sprint.sprint_backlogs.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def backlog_params
      params.require(:sprint_backlog).permit(:story_id, :order)
    end

    def set_sprint
      @sprint = Sprint.find(params[:sprint_id])
    end
end
