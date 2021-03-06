class StoriesController < ApiController
  before_action :set_story, only: [:show, :update, :destroy]

  # GET /stories
  # GET /stories.json
  def index
    unless params["product_id"].nil?
      @stories = Story.where(product_id: params["product_id"]).order(:order)
    else
      @stories = Story.all.order(:order)
    end
  end

  # GET /stories/1
  # GET /stories/1.json
  def show
  end

  # POST /stories
  # POST /stories.json
  def create
    @story = Story.new(story_params)
    if @story.save
      render action: 'show', status: :created, location: @story
    else
      render json: { errors: @story.errors }, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /stories/1
  # PATCH/PUT /stories/1.json
  def update
    if @story.update(story_params)
      head :no_content
    else
      render json: { errors: @story.errors }, status: :unprocessable_entity
    end
  end

  # DELETE /stories/1
  # DELETE /stories/1.json
  def destroy
    @story.destroy
    head :no_content
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_story
      @story = Story.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def story_params
      params.require(:story).permit(:label, :description, :technical_point, :functional_point, :state, :order, :product_id)
    end
end
