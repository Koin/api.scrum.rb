class SprintBacklogsController < ApplicationController
  before_action :set_product
  before_action :set_sprint
  before_action :set_story, only: [:show, :edit, :create, :update, :destroy]
  before_action :set_sprint_backlog, only: [:show, :edit, :update, :destroy]

  # GET /sprint_backlogs
  # GET /sprint_backlogs.json
  def index
    @sprint_backlogs = @sprint.sprint_backlogs.to_a
  end

  # GET /sprint_backlogs/1
  # GET /sprint_backlogs/1.json
  def show
  end

  # GET /sprint_backlogs/1/edit
  def edit
  end

  # POST /sprint_backlogs
  # POST /sprint_backlogs.json
  def create
    @sprint_backlog = @sprint.sprint_backlogs.new(sprint_backlog_params)
    @sprint_backlog.story = @story
    if @sprint_backlog.save
      render action: 'show', status: :created, location: product_sprint_story_url(@product, @sprint, @story, format: :json)
    else
      render json: @sprint_backlog.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /sprint_backlogs/1
  # PATCH/PUT /sprint_backlogs/1.json
  def update
    return render json: { }, status: :not_found if @sprint_backlog.nil?
    if @sprint_backlog.update(sprint_backlog_params)
      head :no_content
    else
      render json: @sprint_backlog.errors, status: :unprocessable_entity
    end
  end

  # DELETE /sprint_backlogs/1
  # DELETE /sprint_backlogs/1.json
  def destroy
    return render json: { }, status: :not_found if @sprint_backlog.nil?
    @sprint_backlog.destroy
    head :no_content
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sprint_backlog
      @sprint_backlog = @sprint.sprint_backlogs.find_by_story_id(@story.id)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sprint_backlog_params
      params[:sprint_backlog]
    end

    def set_product
      @product = Product.find(params[:product_id])
    end

    def set_sprint
      @sprint = @product.sprints.find(params[:sprint_id])
    end

    def set_story
      @story = @product.stories.find(params[:id])
    end
end
