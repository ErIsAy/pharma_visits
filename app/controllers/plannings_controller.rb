class PlanningsController < ApplicationController
  before_action :set_planning, only: [:show, :edit, :update, :destroy]

  # GET /plannings
  # GET /plannings.json
  def index
    # @plannings = Planning.all
    @plannings = current_user.plannings.paginate(:page => params[:page], :per_page => 15)
  end

  # GET /plannings/1
  # GET /plannings/1.json
  def show
  end

  # GET /plannings/new
  def new
    # @planning = Planning.new
    @doctors = Doctor.all
    @planning = current_user.plannings.build
  end

  # GET /plannings/1/edit
  def edit
    @doctors = Doctor.all
  end

  # POST /plannings
  # POST /plannings.json
  def create
    @doctors = Doctor.all
    @planning = current_user.plannings.build(planning_params)

    respond_to do |format|
      if @planning.save
        # format.html { redirect_to @planning, notice: 'Evento asignado a la Ruta correctamente' }
        format.html { redirect_to plannings_path, notice: 'Evento asignado a la Ruta correctamente' }
        format.json { render :show, status: :created, location: @planning }
      else
        format.html { render :new }
        format.json { render json: @planning.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /plannings/1
  # PATCH/PUT /plannings/1.json
  def update
    respond_to do |format|
      if @planning.update(planning_params)
        format.html { redirect_to plannings_path, notice: 'Evento actualizado' }
        format.json { render :show, status: :ok, location: @planning }
      else
        format.html { render :edit }
        format.json { render json: @planning.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /plannings/1
  # DELETE /plannings/1.json
  def destroy
    @planning.destroy
    respond_to do |format|
      format.html { redirect_to plannings_url, notice: 'Evento Eliminado' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_planning
      @planning = Planning.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def planning_params
      params.require(:planning).permit(:title, :date_visit, :shift, :visited, :note, :doctor_id)
    end
end
