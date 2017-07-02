class ReportController < ApplicationController
  def index
  end

  def center
    # if params[:search]
    #   @centers = Center.where('name LIKE ?', "%#{params[:search]}%").paginate(:page => params[:page], :per_page => 20)
    # else
    #   @centers = Center.paginate(:page => params[:page], :per_page => 20)
    # end


    @q = Center.ransack(params[:q])
    @centers = @q.result.paginate(:page => params[:page], :per_page => 20)


    respond_to do |format|
      format.html
      format.pdf do
        @q = Center.ransack(params[:q])
        @centers = @q.result
        @city = params[:q][:city_cont]
        pdf = ReportCenters.new(@centers, @city)
        send_data pdf.render, filename: 'Centros.pdf', type: 'application/pdf', disposition: "inline"
      end
    end


  end

  def doctor
    # if params[:search]
    #   @doctors = Doctor.where('firstname LIKE ?', "%#{params[:search]}%").paginate(:page => params[:page], :per_page => 20)
    # else
    #   @doctors = Doctor.paginate(:page => params[:page], :per_page => 20)
    # end

    @q = Doctor.ransack(params[:q])
    @doctors = @q.result.includes(:center).paginate(:page => params[:page], :per_page => 20)


    respond_to do |format|
      format.html
      format.pdf do
        @q = Doctor.ransack(params[:q])
        @doctors = @q.result
        pdf = ReportDoctors.new(@doctors)
        send_data pdf.render, filename: 'Doctores.pdf', type: 'application/pdf', disposition: "inline"
      end
    end




  end




  def doctor_center
    # @centers = Center.all
    # @doctors = Doctor.all

    if params[:search]
      @centers = Center.all
      @doctors = Doctor.where('firstname LIKE?', "%#{params[:search]}%")
      # @doctors = Doctor.all
      # @doctors = Doctor.all
    else
      @centers = Center.all
      @doctors = Doctor.all
    end



  end

  def drugstore
    if params[:search]
      @drugstores = Drugstore.where('name LIKE ?', "%#{params[:search]}%").paginate(:page => params[:page], :per_page => 20)
    else
      @drugstores = Drugstore.paginate(:page => params[:page], :per_page => 20)
    end

  end

  def planning
    @q = current_user.plannings.ransack(params[:q])
    @plannings = @q.result.includes(:doctor).paginate(:page => params[:page], :per_page => 20)

    # if params[:search]
    #   @plannings = Planning.where('date_visit LIKE ?', "%#{params[:search]}%").paginate(:page => params[:page], :per_page => 20)
    # else
    #   @plannings = Planning.paginate(:page => params[:page], :per_page => 20)
    # end
    # @plannings = current_user.plannings.paginate(:page => params[:page], :per_page => 15)
  end
end
