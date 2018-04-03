class VisitsController < ApplicationController
  before_action :find_planning
  before_action :set_visit, only: [:show, :edit, :update, :destroy]

  # GET /visits
  # GET /visits.json
  def index
    @visits = Visit.all
  end

  # GET /visits/1
  # GET /visits/1.json
  def show
  end

  # GET /visits/new
  def new
    @visit = Visit.new
    # @visit = planning.visits.build

    # if params[:planning]
    #   @planning = Planning.find(params[:planning])
    # end
  end

  # GET /visits/1/edit
  def edit
  end

  # POST /visits
  # POST /visits.json
  def create
    @visit = Visit.new(visit_params)
    @visit.user_id = current_user.id
    # @visit = planning.visits.build(visit_params)
    # @visit.planning = @planning
    @planning = Planning.find(@visit.planning_id)

    respond_to do |format|
      if @visit.save
        @planning.visited = true
        @planning.save

        # format.html { redirect_to @visit, notice: 'Visit was successfully created.' }
        format.html { redirect_to edit_planning_path(@visit.planning.id), notice: 'Visita Registrada' }
        format.json { render :show, status: :created, location: @visit }
      else
        format.html { render :new }
        format.json { render json: @visit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /visits/1
  # PATCH/PUT /visits/1.json
  def update
    respond_to do |format|
      if @visit.update(visit_params)
        format.html { redirect_to @visit, notice: 'Visit was successfully updated.' }
        format.json { render :show, status: :ok, location: @visit }
      else
        format.html { render :edit }
        format.json { render json: @visit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /visits/1
  # DELETE /visits/1.json
  def destroy
    @visit.destroy
    respond_to do |format|
      format.html { redirect_to visits_url, notice: 'Visit was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def find_planning
      @planning = Planning.find(params[:planning_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_visit
      @visit = Visit.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def visit_params
      params.require(:visit).permit(:note, :date_visit, :cycle, :planning_id, :user_id)
    end
end
