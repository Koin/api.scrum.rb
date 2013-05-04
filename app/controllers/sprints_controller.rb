class SprintsController < ApiController
  before_action :set_product
  before_action :set_sprint, only: [:show, :update, :destroy]

  # GET /products/1/sprints
  # GET /products/1/sprints.json
  def index
    @sprints = @product.sprints
  end

  # GET /products/1/sprints/1
  # GET /products/1/sprints/1.json
  def show
  end

  # POST /products/1/sprints
  # POST /products/1/sprints.json
  def create
    @sprint = @product.sprints.new(sprint_params)
    if @sprint.save
      render action: 'show', status: :created, location: [@product, @sprint]
    else
      render json: { errors: @sprint.errors }, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /products/1/sprints/1
  # PATCH/PUT /products/1/sprints/1.json
  def update
    if @sprint.update(sprint_params)
      head :no_content
    else
      render json: { errors: @sprint.errors }, status: :unprocessable_entity
    end
  end

  # DELETE /products/1/sprints/1
  # DELETE /products/1/sprints/1.json
  def destroy
    @sprint.destroy
    head :no_content
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sprint
      @sprint = @product.sprints.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sprint_params
      params.require(:sprint).permit(:start_date, :end_date, :state)
    end

    def set_product
      @product = Product.find(params[:product_id])
    end
end
