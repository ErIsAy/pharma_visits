class DoctorsController < ApplicationController
  before_action :set_doctor, only: [:show, :edit, :update, :destroy]

  # GET /doctors
  # GET /doctors.json
  def index
    # if params[:search]
    #   @doctors = Doctor.where('firstname LIKE ?', "%#{params[:search]}%").paginate(:page => params[:page], :per_page => 20)
    #   # @doctors = Doctor.where(:firstname => params[:search]).paginate(:page => params[:page], :per_page => 20)
    # else
    #   @doctors = Doctor.paginate(:page => params[:page], :per_page => 20)
    # end
    # @doctors = Doctor.all
    # @doctors = Doctor.paginate(:page => params[:page], :per_page => 20)

    # respond_to do |format|
    #   format.html
    #   format.pdf do
    #     pdf = ReportDoctors.new(@doctors)
    #     send_data pdf.render, filename: 'Doctores.pdf', type: 'application/pdf'
    #   end
    # end
    # @q = Doctor.ransack(params[:q])

    if current_user.admin
      @q = Doctor.ransack(params[:q])
      @doctors = @q.result.paginate(:page => params[:page], :per_page => 20)
    else
      @q = current_user.doctors.ransack(params[:q])
      @doctors = @q.result.includes(:center).paginate(:page => params[:page], :per_page => 20)
    end

  end

  # GET /doctors/1
  # GET /doctors/1.json
  def show
  end

  # GET /doctors/new
  def new
    # @doctor = Doctor.new
    if current_user.admin
      @centers = Center.all
    else 
      @centers = current_user.centers
    end
    @doctor = current_user.doctors.build
  end

  # GET /doctors/1/edit
  def edit
    @centers = Center.all
  end

  # POST /doctors
  # POST /doctors.json
  def create
    # @doctor = Doctor.new(doctor_params)
    @centers = Center.all
    @doctor = current_user.doctors.build(doctor_params)

    respond_to do |format|
      if @doctor.save
        # format.html { redirect_to @doctor, notice: 'Doctor was successfully created.' }
        format.html { redirect_to doctors_path, notice: 'Doctor registrado exitosamente.'}
        format.json { render :show, status: :created, location: @doctor }
      else
        format.html { render :new }
        format.json { render json: @doctor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /doctors/1
  # PATCH/PUT /doctors/1.json
  def update
    respond_to do |format|
      if @doctor.update(doctor_params)
        # format.html { redirect_to @doctor, notice: 'Doctor was successfully updated.' }
        format.html { redirect_to doctors_path, notice: 'Doctor actualizado exitosamente.'}
        format.json { render :show, status: :ok, location: @doctor }
      else
        format.html { render :edit }
        format.json { render json: @doctor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /doctors/1
  # DELETE /doctors/1.json
  def destroy
    @doctor.destroy
    respond_to do |format|
      format.html { redirect_to doctors_url, notice: 'Doctor ha sido eliminado.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_doctor
      @doctor = Doctor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def doctor_params
      params.require(:doctor).permit(:firstname,
                                     :lastname,
                                     :speciality,
                                     :suite,
                                     :phone_ext,
                                     :email,
                                     :category,
                                     :birthday,
                                     :center_id)
    end
end
