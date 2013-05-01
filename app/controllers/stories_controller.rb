class StoriesController < ApplicationController
  before_action :set_product
  before_action :set_story, only: [:show, :update, :destroy]

  # GET /products/1/stories
  # GET /products/1/stories.json
  def index
    @stories = @product.stories
  end

  # GET /products/1/stories/1
  # GET /products/1/stories/1.json
  def show
  end

  # POST /products/1/stories
  # POST /products/1/stories.json
  def create
    @story = @product.stories.new(story_params)
    if @story.save
      render action: 'show', status: :created, location: [@product, @story]
    else
      render json: { errors: @story.errors }, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /products/1/stories/1
  # PATCH/PUT /products/1/stories/1.json
  def update
    if @story.update(story_params)
      head :no_content
    else
      render json: { errors: @story.errors }, status: :unprocessable_entity
    end
  end

  # DELETE /products/1/stories/1
  # DELETE /products/1/stories/1.json
  def destroy
    @story.destroy
    head :no_content
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_story
      @story = @product.stories.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def story_params
      params.require(:story).permit(:label, :description, :technical_point, :functional_point, :state, :product_id)
    end

    def set_product
      @product = Product.find(params[:product_id])
    end
end
