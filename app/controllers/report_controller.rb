class ReportController < ApplicationController
  def index
  end

  def center
    # if params[:search]
    #   @centers = Center.where('name LIKE ?', "%#{params[:search]}%").paginate(:page => params[:page], :per_page => 20)
    # else
    #   @centers = Center.paginate(:page => params[:page], :per_page => 20)
    # end


    # @q = current_user.centers.ransack(params[:q])
    # @centers = @q.result.paginate(:page => params[:page], :per_page => 20)


    if current_user.admin
      @q = Center.ransack(params[:q])
      @centers = @q.result.paginate(:page => params[:page], :per_page => 20).order('name ASC')
    else
      @q = current_user.centers.ransack(params[:q])
      @centers = @q.result.paginate(:page => params[:page], :per_page => 20).order('name ASC')
    end

    respond_to do |format|
      format.html
      format.pdf do
        @q = Center.ransack(params[:q])
        @centers = @q.result.order('name ASC')
        @city = params[:q][:city_cont]
        pdf = ReportCenters.new(@centers, @city, current_user)
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

    # @q = current_user.doctors.ransack(params[:q])
    # @doctors = @q.result.includes(:center).paginate(:page => params[:page], :per_page => 20)

    if current_user.admin
      @q = Doctor.ransack(params[:q])
      @doctors = @q.result.paginate(:page => params[:page], :per_page => 20).order('firstname ASC')
    else
      @q = current_user.doctors.ransack(params[:q])
      @doctors = @q.result.includes(:center).paginate(:page => params[:page], :per_page => 20).order('firstname ASC')
    end

    respond_to do |format|
      format.html
      format.pdf do
        @q = Doctor.ransack(params[:q])
        @doctors = @q.result
        pdf = ReportDoctors.new(@doctors, current_user)
        send_data pdf.render, filename:"Doctores_#{Date.parse(Time.now.to_s)}.pdf", type: 'application/pdf', disposition: "inline"
      end
    end


  end




  def doctor_center
    # @centers = Center.all
    # @doctors = Doctor.all

    # if params[:search]
    #   @centers = Center.all
    #   @doctors = Doctor.where('firstname LIKE?', "%#{params[:search]}%")
    #   # @doctors = Doctor.all
    #   # @doctors = Doctor.all
    # else
    #   @centers = Center.all
    #   @doctors = Doctor.all
    # end

    if current_user.admin
      @q = Doctor.ransack(params[:q])
      @doctors = @q.result.includes(:center).paginate(:page => params[:page], :per_page => 20).order('firstname ASC')
      @centers = Center.all
    else
      @q = current_user.doctors.ransack(params[:q])
      @doctors = @q.result.includes(:center).paginate(:page => params[:page], :per_page => 20).order('firstname ASC')
      @centers = current_user.centers
    end




    respond_to do |format|
      format.html
      format.pdf do
        @q = Doctor.ransack(params[:q])
        @doctors = @q.result.includes(:center)
        @center = params[:q][:center_name_cont]
        pdf = ReportDbc.new(@doctors, @center, current_user)
        send_data pdf.render, filename: 'Doctores_por_centro_#{Date.parse(Time.now.to_s)}.pdf', type: 'application/pdf', disposition: "inline"
      end
    end


  end

  def drugstore
    # if params[:search]
    #   @drugstores = Drugstore.where('name LIKE ?', "%#{params[:search]}%").paginate(:page => params[:page], :per_page => 20)
    # else
    #   @drugstores = Drugstore.paginate(:page => params[:page], :per_page => 20)
    # end



    if current_user.admin
      @q = Drugstore.ransack(params[:q])
      @drugstores = @q.result.paginate(:page => params[:page], :per_page => 20).order('name ASC')
    else
      @q = current_user.drugstores.ransack(params[:q])
      @drugstores = @q.result.paginate(:page => params[:page], :per_page => 20).order('name ASC')
    end

    respond_to do |format|
      format.html
      format.pdf do
        @q = Drugstore.ransack(params[:q])
        @drugstores = @q.result
        @city = params[:q][:city_cont]
        pdf = ReportDrugstores.new(@drugstores, @city)
        send_data pdf.render, filename: "Farmacias_#{Date.parse(Time.now.to_s)}.pdf", type: 'application/pdf', disposition: "inline"
      end
    end



  end

  def planning


    if current_user.admin
      @q = Planning.ransack(params[:q])
      @plannings = @q.result.paginate(:page => params[:page], :per_page => 20)
    else
      @q = current_user.plannings.ransack(params[:q])
      @plannings = @q.result.includes(:doctor, :user).paginate(:page => params[:page], :per_page => 20)  
    end


    respond_to do |format|
      format.html
      format.pdf do
        # @q = current_user.plannings.ransack(params[:q])
        @q.sorts = 'date_visit desc'
        # @plannings = @q.result.includes(:doctor, :user)
        @user = params[:q][:user_username_cont]
        pdf = ReportPlannings.new(@plannings, current_user)
        send_data pdf.render, filename: "Plan_por_Usuario#{Date.parse(Time.now.to_s)}.pdf", type: 'application/pdf', disposition: "inline"
      end
    end


    # if params[:search]
    #   @plannings = Planning.where('date_visit LIKE ?', "%#{params[:search]}%").paginate(:page => params[:page], :per_page => 20)
    # else
    #   @plannings = Planning.paginate(:page => params[:page], :per_page => 20)
    # end
    # @plannings = current_user.plannings.paginate(:page => params[:page], :per_page => 15)
  end

  def visits
    # if current_user.admin
    #   @q = Planning.ransack(params[:q])
    #   @plannings = @q.result.paginate(:page => params[:page], :per_page => 20)
    # else
    #   @q = current_user.plannings.ransack(params[:q])
    #   @plannings = @q.result.includes(:doctor, :user).paginate(:page => params[:page], :per_page => 20)  
    # end
    # byebug
    @visits = Visit.where(cycle: Cycle.last.name)
    @users = User.all
    # byebug
    respond_to do |format|
      format.html
      format.pdf {
        render template: 'report/visits',
        pdf: 'Visitas',
        layout: 'pdf.html'
      }
    end

  end 




end
