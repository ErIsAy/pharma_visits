class EjesController < ApplicationController
  before_action :set_eje, only: [:show, :edit, :update, :destroy]

  # GET /ejes
  # GET /ejes.json
  def index
    @ejes = Eje.all
  end

  # GET /ejes/1
  # GET /ejes/1.json
  def show
  end

  # GET /ejes/new
  def new
    @eje = Eje.new
  end

  # GET /ejes/1/edit
  def edit
  end

  # POST /ejes
  # POST /ejes.json
  def create
    @eje = Eje.new(eje_params)

    respond_to do |format|
      if @eje.save
        format.html { redirect_to @eje, notice: 'Eje was successfully created.' }
        format.json { render :show, status: :created, location: @eje }
      else
        format.html { render :new }
        format.json { render json: @eje.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ejes/1
  # PATCH/PUT /ejes/1.json
  def update
    respond_to do |format|
      if @eje.update(eje_params)
        format.html { redirect_to @eje, notice: 'Eje was successfully updated.' }
        format.json { render :show, status: :ok, location: @eje }
      else
        format.html { render :edit }
        format.json { render json: @eje.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ejes/1
  # DELETE /ejes/1.json
  def destroy
    @eje.destroy
    respond_to do |format|
      format.html { redirect_to ejes_url, notice: 'Eje was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_eje
      @eje = Eje.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def eje_params
      params.require(:eje).permit(:name, :division_id)
    end
end
