class SprintBacklogsController < ApplicationController
  before_action :set_sprint_backlog, only: [:show, :edit, :update, :destroy]

  # GET /sprint_backlogs
  # GET /sprint_backlogs.json
  def index
    @sprint_backlogs = SprintBacklog.all
  end

  # GET /sprint_backlogs/1
  # GET /sprint_backlogs/1.json
  def show
  end

  # GET /sprint_backlogs/new
  def new
    @sprint_backlog = SprintBacklog.new
  end

  # GET /sprint_backlogs/1/edit
  def edit
  end

  # POST /sprint_backlogs
  # POST /sprint_backlogs.json
  def create
    @sprint_backlog = SprintBacklog.new(sprint_backlog_params)

    respond_to do |format|
      if @sprint_backlog.save
        format.html { redirect_to @sprint_backlog, notice: 'Sprint backlog was successfully created.' }
        format.json { render action: 'show', status: :created, location: @sprint_backlog }
      else
        format.html { render action: 'new' }
        format.json { render json: @sprint_backlog.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sprint_backlogs/1
  # PATCH/PUT /sprint_backlogs/1.json
  def update
    respond_to do |format|
      if @sprint_backlog.update(sprint_backlog_params)
        format.html { redirect_to @sprint_backlog, notice: 'Sprint backlog was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @sprint_backlog.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sprint_backlogs/1
  # DELETE /sprint_backlogs/1.json
  def destroy
    @sprint_backlog.destroy
    respond_to do |format|
      format.html { redirect_to sprint_backlogs_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sprint_backlog
      @sprint_backlog = SprintBacklog.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sprint_backlog_params
      params[:sprint_backlog]
    end
end
