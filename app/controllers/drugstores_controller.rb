class DrugstoresController < ApplicationController
  before_action :set_drugstore, only: [:show, :edit, :update, :destroy]

  # GET /drugstores
  # GET /drugstores.json
  def index
    # if params[:search]
    #   @drugstores = Drugstore.where('name LIKE ?', "%#{params[:search]}%").paginate(:page => params[:page], :per_page => 20)
    #   # @doctors = Doctor.where(:firstname => params[:search]).paginate(:page => params[:page], :per_page => 20)
    # else
    #   @drugstores = Drugstore.paginate(:page => params[:page], :per_page => 20)
    # end
    
    # @q = current_user.drugstores.ransack(params[:q])
    # @drugstores = @q.result.paginate(:page => params[:page], :per_page => 20)



    if current_user.admin
      @q = Drugstore.ransack(params[:q])
      @drugstores = @q.result.paginate(:page => params[:page], :per_page => 20)
    else
      @q = current_user.drugstores.ransack(params[:q])
      @drugstores = @q.result.paginate(:page => params[:page], :per_page => 20)
    end

    @drugs = @q.result
    # @drugstores = Drugstore.all
    # @drugstores = Drugstore.paginate(:page => params[:page], :per_page => 20)
    respond_to do |format|
      format.html
      format.pdf do
        pdf = ReportDrugstores.new(@drugstores)
        send_data pdf.render, filename: 'Farmacias.pdf', type: 'application/pdf'
      end
      format.xlsx {response.headers['Content-Disposition'] = 'attachment; filename="Farmacias.xlsx"'}
    end
  end

  # GET /drugstores/1
  # GET /drugstores/1.json
  def show
  end

  # GET /drugstores/new
  def new
    @drugstore = current_user.drugstores.build
  end

  # GET /drugstores/1/edit
  def edit
  end

  # POST /drugstores
  # POST /drugstores.json
  def create
    @drugstore = current_user.drugstores.build(drugstore_params)

    respond_to do |format|
      if @drugstore.save
        format.html { redirect_to drugstores_url, notice: 'Farmacia creata exitosamente' }
        format.json { render :show, status: :created, location: @drugstore }
      else
        format.html { render :new }
        format.json { render json: @drugstore.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /drugstores/1
  # PATCH/PUT /drugstores/1.json
  def update
    respond_to do |format|
      if @drugstore.update(drugstore_params)
        format.html { redirect_to drugstores_url, notice: 'Actualización existosa' }
        format.json { render :show, status: :ok, location: @drugstore }
      else
        format.html { render :edit }
        format.json { render json: @drugstore.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /drugstores/1
  # DELETE /drugstores/1.json
  def destroy
    @drugstore.destroy
    respond_to do |format|
      format.html { redirect_to drugstores_url, notice: 'Elimninado exitosamente' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_drugstore
      @drugstore = Drugstore.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def drugstore_params
      params.require(:drugstore).permit(:name, :phone, :address, :city, :service_person, :sales_person)
    end
end
