class MetricUploadsController < ApplicationController
  def index
    @metric_uploads = MetricUpload.all
  end

  def new
    @metric_upload = MetricUpload.new
  end

  def create
    @metric_upload = MetricUpload.new(metric_upload_params)

    if @metric_upload.save
      redirect_to metric_uploads_path, notice: "El reporte #{@metric_upload.name} se ha agregado correctamente."
    else
      render "new"
    end
  end

  def destroy
    @metric_upload = MetricUpload.find(params[:id])
    @metric_upload.destroy
    redirect_to metric_uploads_path, notice:  "El reporte #{@metric_upload.name} ha sido eliminado."
  end

private
  def metric_upload_params
    params.require(:metric_upload).permit(:name, :attachment)
  end
end
