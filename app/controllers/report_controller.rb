class ReportController < ApplicationController
  def index
  end

  def center
    if params[:search]
      @centers = Center.where('name LIKE ?', "%#{params[:search]}%").paginate(:page => params[:page], :per_page => 20)
    else
      @centers = Center.paginate(:page => params[:page], :per_page => 20)
    end
  end

  def doctor
    if params[:search]
      @doctors = Doctor.where('firstname LIKE ?', "%#{params[:search]}%").paginate(:page => params[:page], :per_page => 20)
    else
      @doctors = Doctor.paginate(:page => params[:page], :per_page => 20)
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
    if params[:search]
      @plannings = Planning.where('date_visit LIKE ?', "%#{params[:search]}%").paginate(:page => params[:page], :per_page => 20)
    else
      @plannings = Planning.paginate(:page => params[:page], :per_page => 20)
    end
    # @plannings = current_user.plannings.paginate(:page => params[:page], :per_page => 15)
  end
end
