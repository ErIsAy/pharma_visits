
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
  
    @users = User.all
    @cir = {}
    @cir_max = {}
    @cir_onco = {}
    @cir_ped = {}
    @cir_plast = {}
    @cir_proc = {}
    @cir_vas = {}
    @derm = {}
    @diabe = {}
    @endo = {}
    @fis = {}
    @gastro = {}
    @geria = {}
    @intensi = {}
    @gin = {}
    @hema = {}
    @mf = {}
    @mg = {}
    @mi = {}
    @nefro = {}
    @neuro = {}
    @neuro_cir = {}
    @orto = {}
    @reuma = {}
    @uro = {}


    @users.each do |u|
      u.calc_speciality
      @cir[u.username] = u.cir
      @cir_max[u.username] = u.cir_max
      @cir_onco[u.username] = u.cir_onco
      @cir_ped[u.username] = u.cir_ped
      @cir_plast[u.username] = u.cir_plast
      @cir_proc[u.username] = u.cir_proc
      @cir_vas[u.username] = u.cir_vas
      @derm[u.username] = u.derm
      @diabe[u.username] = u.diabe
      @endo[u.username] = u.endo
      @fis[u.username] = u.fis
      @gastro[u.username] = u.gastro
      @geria[u.username] = u.geria
      @intensi[u.username] = u.intensi
      @gin[u.username] = u.gin
      @hema[u.username] = u.hema
      @mf[u.username] = u.mf
      @mg[u.username] = u.mg
      @mi[u.username] = u.mi
      @nefro[u.username] = u.nefro
      @neuro[u.username] = u.neuro
      @neuro_cir[u.username] = u.neuro_cir
      @orto[u.username] = u.orto
      @reuma[u.username] = u.reuma
      @uro[u.username] = u.uro
    end

     @cir_obj = @cir.map{|e| {username: e[0], value: e[1]}}
     @cir_max_obj = @cir_max.map{|e| {username: e[0], value: e[1]}}
     @cir_onco_obj = @cir_onco.map{|e| {username: e[0], value: e[1]}}
     @cir_ped_obj = @cir_ped.map{|e| {username: e[0], value: e[1]}}
     @cir_plast_obj = @cir_plast.map{|e| {username: e[0], value: e[1]}}
     @cir_proc_obj = @cir_proc.map{|e| {username: e[0], value: e[1]}}
     @cir_vas_obj = @cir_vas.map{|e| {username: e[0], value: e[1]}}
     @derm_obj = @derm.map{|e| {username: e[0], value: e[1]}}
     @diabe_obj = @diabe.map{|e| {username: e[0], value: e[1]}}
     @endo_obj = @endo.map{|e| {username: e[0], value: e[1]}}
     @fis_obj = @fis.map{|e| {username: e[0], value: e[1]}}
     @gastro_obj = @gastro.map{|e| {username: e[0], value: e[1]}}
     @geria_obj = @geria.map{|e| {username: e[0], value: e[1]}}
     @intensi_obj = @intensi.map{|e| {username: e[0], value: e[1]}}
     @gin_obj = @gin.map{|e| {username: e[0], value: e[1]}}
     @hema_obj = @hema.map{|e| {username: e[0], value: e[1]}}
     @mf_obj = @mf.map{|e| {username: e[0], value: e[1]}}
     @mg_obj = @mg.map{|e| {username: e[0], value: e[1]}}
     @mi_obj = @mi.map{|e| {username: e[0], value: e[1]}}
     @nefro_obj = @nefro.map{|e| {username: e[0], value: e[1]}}
     @neuro_obj = @neuro.map{|e| {username: e[0], value: e[1]}}
     @neuro_cir_obj = @neuro_cir.map{|e| {username: e[0], value: e[1]}}
     @orto_obj = @orto.map{|e| {username: e[0], value: e[1]}}
     @reuma_obj = @reuma.map{|e| {username: e[0], value: e[1]}}
     @uro_obj = @uro.map{|e| {username: e[0], value: e[1]}}

     
 
    

 
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
