class DoctorsController < ApplicationController
  before_action :set_doctor, only: [:show, :edit, :update, :destroy]

  # GET /doctors
  # GET /doctors.json
  def index
    @doctors = Doctor.all
  end

  # GET /doctors/1
  # GET /doctors/1.json
  def show
  end

  # GET /doctors/new
  def new
    @doctor = Doctor.new
    @centers = Center.all
  end

  # GET /doctors/1/edit
  def edit
    @centers = Center.all
  end

  # POST /doctors
  # POST /doctors.json
  def create
    @doctor = Doctor.new(doctor_params)
    @centers = Center.all

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
                                     :phone,
                                     :phone_ext,
                                     :email,
                                     :birthday,
                                     :center_id)
    end
end
