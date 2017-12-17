class CentersController < ApplicationController
  before_action :set_center, only: [:show, :edit, :update, :destroy]

  # GET /centers
  # GET /centers.json
  def index
    # if params[:search]
    #   @centers = Center.where('name LIKE ?', "%#{params[:search]}%").paginate(:page => params[:page], :per_page => 20)
    # else
    #   @centers = Center.paginate(:page => params[:page], :per_page => 20)
    # end

    if current_user.admin
      @q = Center.ransack(params[:q])
      @centers = @q.result.paginate(:page => params[:page], :per_page => 20).order('name ASC')
    else
      @q = current_user.centers.ransack(params[:q])
      @centers = @q.result.paginate(:page => params[:page], :per_page => 20).order('name ASC')
    end

    # @centers = Center.all
    # @centers = Center.paginate(:page => params[:page], :per_page => 20)
    # respond_to do |format|
    #   format.html
    #   format.pdf do
    #     pdf = ReportCenters.new(@centers)
    #     send_data pdf.render, filename: 'Centros.pdf', type: 'application/pdf'
    #   end
    # end
  end

  # GET /centers/1
  # GET /centers/1.json
  def show
    @doctors = Doctor.joins(:center).where(center_id: @center)
  end

  # GET /centers/new
  def new
    # @center = Center.new
    @center = current_user.centers.build
    
  end

  # GET /centers/1/edit
  def edit
  end

  # POST /centers
  # POST /centers.json
  def create
    # @center = Center.new(center_params)
    @center = current_user.centers.build(center_params)

    respond_to do |format|
      if @center.save
        # format.html { redirect_to @center, notice: 'Center was successfully created.' }
        format.html { redirect_to centers_path, notice: 'Centro Médico creado exitosamente.' }
        format.json { render :show, status: :created, location: @center }
      else
        format.html { render :new }
        format.json { render json: @center.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /centers/1
  # PATCH/PUT /centers/1.json
  def update
    respond_to do |format|
      if @center.update(center_params)
        # format.html { redirect_to @center, notice: 'Center was successfully updated.' }
        format.html { redirect_to centers_path, notice: 'Centro Médico actualizado exitosamente.' }
        format.json { render :show, status: :ok, location: @center }
      else
        format.html { render :edit }
        format.json { render json: @center.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /centers/1
  # DELETE /centers/1.json
  def destroy
    @center.destroy
    respond_to do |format|
      format.html { redirect_to centers_url, notice: 'Centro Médico ha sido eliminado.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_center
      @center = Center.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def center_params
      params.require(:center).permit(:name, :address, :city, :region, :phone, :lat, :lng)
    end
end
