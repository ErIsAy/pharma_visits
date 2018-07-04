class PlanningsController < ApplicationController
  before_action :set_planning, only: [:show, :edit, :update, :destroy]
  after_action :set_date, only: [:create, :update]
  include ApplicationHelper

  # GET /plannings
  # GET /plannings.json
  def index
    # @plannings = Planning.all
    # @plannings = current_user.plannings.paginate(:page => params[:page], :per_page => 15)
    @visits = current_user.visits
    @period = Cycle.last.period

    if params[:q]
      @user = params[:q][:user_username_eq]
    end

    if current_user.admin
      @centers = Center.all
      @q = Planning.ransack(params[:q])
      @plannings = @q.result.paginate(:page => params[:page], :per_page => 20).order('date_visit ASC')
    else
      @centers = current_user.centers
      @q = current_user.plannings.ransack(params[:q])
      @plannings = @q.result.includes(:doctor).paginate(:page => params[:page], :per_page => 20).order('date_visit ASC')
    end

    # respond_to do |format|
    #   format.html
    #   format.pdf do
    #     pdf = ReportPlannings.new(@plannings)
    #     send_data pdf.render, filename: 'PlanMensual.pdf', type: 'application/pdf'
    #   end
    # end
  end

  # GET /plannings/1
  # GET /plannings/1.json
  def show
  end

  # GET /plannings/new
  def new
    # @planning = Planning.new
    # @doctors = Doctor.all
    @doctors = current_user.doctors
    @planning = current_user.plannings.build
    @drugstores = current_user.drugstores
  end

  # GET /plannings/1/edit
  def edit
    # @doctors = Doctor.all
    @visits = @planning.visits
    @doctors = current_user.doctors
    @drugstores = current_user.drugstores
  end

  # POST /plannings
  # POST /plannings.json
  def create
    # @doctors = Doctor.all
    @doctors = current_user.doctors
    @drugstores = current_user.drugstores
    @planning = current_user.plannings.build(planning_params)
    @planning.cycle_id = Cycle.last.id

    unless !@planning.day.present?
     @planning.date_visit = Chronic.parse("first monday of this #{Date::MONTHNAMES[current_cycle.month]}") + @planning.day.days
    end

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
    # planning_params.date_visit = Chronic.parse("first monday of this #{Date::MONTHNAMES[current_cycle.month]}") + @planning.day.days
    # byebug
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

  def set_date
    unless !@planning.day.present?
      @planning.date_visit = Chronic.parse("first monday of this #{Date::MONTHNAMES[current_cycle.month]}") + @planning.day.days
    end
    @planning.save
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_planning
      @planning = Planning.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def planning_params
      params.require(:planning).permit(:title, :date_visit, :shift,
                                        :visited, :note, :doctor_id, :drugstore_id , :day)
    end
end
