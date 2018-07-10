class ProductUploadsController < ApplicationController
  def index
    @product_uploads = ProductUpload.all
  end

  def new
    @product_upload = ProductUpload.new
  end

  def create
    @product_upload = ProductUpload.new(product_upload_params)

    if @product_upload.save
      redirect_to product_uploads_path, notice: "El Producto #{@product_upload.name} se ha agregado correctamente."
    else
      render "new"
    end
  end

  def destroy
    @product_upload = ProductUpload.find(params[:id])
    @product_upload.destroy
    redirect_to product_uploads_path, notice:  "El Producto #{@product_upload.name} ha sido eliminado."
  end

private
  def product_upload_params
    params.require(:product_upload).permit(:name, :attachment)
  end
end
