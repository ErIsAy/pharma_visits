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


    if params[:q]
      @user = params[:q][:user_username_eq]
    end
    
    respond_to do |format|
      format.html
      format.pdf do
        @q = Center.ransack(params[:q])
        @centers = @q.result.order('name ASC')
        @city = params[:q][:city_cont]
        pdf = ReportCenters.new(@q.result.order('name ASC'), @city, current_user, params[:q])
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
      @centers = Center.all.order('name ASC')
      @q = Doctor.ransack(params[:q])
      @doctors = @q.result.paginate(:page => params[:page], :per_page => 20).order('firstname ASC')
    else
      @centers = current_user.centers.order('name ASC')
      @q = current_user.doctors.ransack(params[:q])
      @doctors = @q.result.includes(:center).paginate(:page => params[:page], :per_page => 20).order('firstname ASC')
    end


    if params[:q]
      @user = params[:q][:user_username_eq]
    end


    respond_to do |format|
      format.html
      format.pdf do
        @q = Doctor.ransack(params[:q])
        @doctors = @q.result
        pdf = ReportDoctors.new(@q.result.order('firstname ASC'), current_user, params[:q])
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
        pdf = ReportDbc.new(@doctors, @center, current_user, params[:q])
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
    
    if params[:q]
      @user = params[:q][:user_username_eq]
    end
    
    respond_to do |format|
      format.html
      format.pdf do
        @q = Drugstore.ransack(params[:q])
        @drugstores = @q.result
        @city = params[:q][:city_cont]
        pdf = ReportDrugstores.new(@q.result.order('name ASC'), @city, params[:q])
        send_data pdf.render, filename: "Farmacias_#{Date.parse(Time.now.to_s)}.pdf", type: 'application/pdf', disposition: "inline"
      end
    end



  end

  def planning


    if current_user.admin
      @q = Planning.ransack(params[:q])
      @plannings = @q.result.paginate(:page => params[:page], :per_page => 20).order('date_visit DESC')
      
    else
      @q = current_user.plannings.ransack(params[:q])
      @plannings = @q.result.includes(:doctor, :user).paginate(:page => params[:page], :per_page => 20).order('date_visit DESC')
    end

    if params[:q]
      @user = params[:q][:user_username_eq]
    end


    respond_to do |format|
      format.html
      format.pdf do
        # @q = current_user.plannings.ransack(params[:q])
        @q.sorts = 'date_visit desc'
        # @plannings = @q.result.includes(:doctor, :user)
        @user = params[:q][:user_username_cont]
        pdf = ReportPlannings.new(@q.result.includes(:doctor), current_user, params[:q])
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

  def visits_report

    if params[:q]
      @user = params[:q][:user_username_eq]
    end

    if current_user.admin?
      @q = Visit.ransack(params[:q])
      @visits = @q.result.paginate(:page => params[:page], :per_page => 20).order('created_at DESC')
    else
      @q = current_user.visits.ransack(params[:q])
      @visits = @q.result.paginate(:page => params[:page], :per_page => 20).order('created_at DESC')
    end

    if params[:q]
      @cycle = params[:q][:cycle_eq]
    else
      @cycle = Cycle.last.name
    end

    respond_to do |format|
      format.html
      format.pdf {
        render template: 'report/visits_report',
        pdf: 'Visitas',
        layout: 'pdf.html'
      }
    end

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
    # @visits = Visit.where(cycle: Cycle.last.name).order('user_id ASC')
    # @users = User.all

    if current_user.admin?
      # @visits = Visit.all
      @visits = Visit.where(cycle: Cycle.find(params[:cycle_id]).name).order('user_id ASC')
      # byebug
      @users = User.all
    else 
      @visits = current_user.visits.where(cycle: Cycle.find(params[:cycle_id]).name).order('user_id ASC')
      @users = User.where(id: current_user.id)
      # @visits = Visit.where(cycle: Cycle.last.name).order('user_id ASC')
    end
    

    @cycle_id = params[:cycle_id]
      
  


    # byebug
    respond_to do |format|
      format.html
      format.pdf {
        render template: 'report/visits',
        pdf: 'Metricas',
        layout: 'pdf.html'
      }
    end

  end 




end
