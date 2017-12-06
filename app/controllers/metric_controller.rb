
class MetricController < ApplicationController


  def registers

    if current_user.admin
      @doctors = Doctor.all
      @centers = Center.all
      @drugstores = Drugstore.all
      @plannings = Planning.all
    else
      @doctors = current_user.doctors
      @centers = current_user.centers
      @drugstores = current_user.drugstores
      @plannings = current_user.plannings
    end



  end

  def print_report

    @q = Planning.ransack(params[:q])
    @plannings = @q.result.includes(:cycle)
    @plannings = @plannings.group(:user_id, :id)
    @cycles = Cycle.all
    @users = User.all

    respond_to do |format|
      # format.html
      format.pdf do
        @q = Planning.ransack(params[:q])
        # @q.sorts = 'date_visit desc'
        @plannings = @q.result.includes(:doctor, :user)
        # @user = params[:q][:user_username_cont]
        pdf = ReportMetrics.new(@plannings, params[:q][:cycle_id_eq], @users)
        send_data pdf.render, filename: "Metricas_#{Date.parse(Time.now.to_s)}.pdf", type: 'application/pdf', disposition: "inline"
      end
    end

  end


  def index
      
      @plannings = Planning.all

      if current_user.admin
        @users = User.all
        @q = Planning.ransack(params[:q])
        @plannings = @q.result.includes(:cycle, :user)
        # @plannings = @plannings.group(:user_id, :id)
        # @cycles = Cycle.all
        # @ejes = Eje.all

        @users.each do |u|
          if !u.admin
            u.planned_visit = Planning.where(:user_id => u.id).count

            u.visit_done = Planning.where(:user_id => u.id).
                                      where(:visited => true).count

            u.metric = Planning.where(:user_id => u.id).
                                where(:visited => true).count.to_f / Planning.where(:user_id => u.id).count.to_f
          end
        end

      else
        @users = User.all
        @q = current_user.plannings.ransack(params[:q])
        @plannings = @q.result.includes(:cycle, :user)
        # @plannings = @plannings.group(:user_id, :id)
        # @cycles = Cycle.all
        # @ejes = Eje.all

        @users.each do |u|
          if !u.admin
            u.planned_visit = Planning.where(:user_id => u.id).count

            u.visit_done = Planning.where(:user_id => u.id).
                                      where(:visited => true).count

            u.metric = Planning.where(:user_id => u.id).
                                where(:visited => true).count.to_f / Planning.where(:user_id => u.id).count.to_f
          end
        end
      end


  end
end
