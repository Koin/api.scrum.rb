module Backlog
  class StoriesController < ApiController
    before_action :set_product
    before_action :set_sprint
    before_action :set_backlog_story, only: [:show, :update, :destroy]

    # GET /products/1/sprints/1/backlog/stories
    # GET /products/1/sprints/1/backlog/stories.json
    def index
      @sprint_backlogs = @sprint.sprint_backlogs.order(:order).to_a
    end

    # GET /products/1/sprints/1/backlog/stories/1
    # GET /products/1/sprints/1/backlog/stories/1.json
    def show
    end

    # POST /products/1/sprints/1/backlog/stories
    # POST /products/1/sprints/1/backlog/stories.json
    def create
      @sprint_backlog = @sprint.sprint_backlogs.new(backlog_params)
      if @sprint_backlog.save
        render action: 'show', status: :created, location: product_sprint_backlog_story_url(@product, @sprint, @sprint_backlog, format: :json)
      else
        render json: @sprint_backlog.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /products/1/sprints/1/backlog/stories/1
    # PATCH/PUT /products/1/sprints/1/backlog/stories/1.json
    def update
      return render json: { }, status: :not_found if @sprint_backlog.nil?
      if @sprint_backlog.update(backlog_params)
        head :no_content
      else
        render json: @sprint_backlog.errors, status: :unprocessable_entity
      end
    end

    # DELETE /products/1/sprints/1/backlog/stories/1
    # DELETE /products/1/sprints/1/backlog/stories/1.json
    def destroy
      @sprint_backlog.destroy
      head :no_content
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_backlog_story
        @sprint_backlog = @sprint.sprint_backlogs.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def backlog_params
        params.require(:backlog).permit(:story_id)
      end

      def set_product
        @product = Product.find(params[:product_id])
      end

      def set_sprint
        @sprint = @product.sprints.find(params[:sprint_id])
      end
  end
end
