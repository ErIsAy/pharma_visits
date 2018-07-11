class ReportPlannings < Prawn::Document
  def initialize(plannings, user, params)
    super()
    image "public/logo_big.png", :scale => 0.4
    @params = params
    @plannings = plannings
    @user = user
    move_down 20
    header
    move_down 10
    body

  end

  def header
    text "Reporte de Plan por Visitador", style: :italic
    if @user.admin
      text "Por Usuarios"
    else
      text "Usuario: #{@user.username}"
    end
    
    text "Fecha de Reporte: #{Time.now.strftime("%F")}", :align => :right

    text "Desde: #{@params["date_visit_gteq"]}"
    text "Hasta: #{@params["date_visit_lteq"]}"
    text "Doctor: #{@params["doctor_firstname_or_doctor_lastname_cont"]}"
    text "Especialidad: #{@params["doctor_speciality_eq"]}"
    text "Usuario: #{@params["user_username_eq"]}"

  end


  def body
    table([["Usuario","Doctor","Fecha","Visitado"]], :column_widths => [125,175,100,100], :row_colors => ["9FA8DA"])


    if @user.admin
      @plannings.each do |planning|
        if planning.drugstore.present?
          table([[planning.user.username, planning.drugstore.name, planning.date_visit, visited_val(planning.visited) ]], :column_widths => [125,175,100,100])
        else
          table([[planning.user.username,"#{planning.doctor.firstname} #{planning.doctor.lastname} (#{planning.doctor.speciality})", planning.date_visit, visited_val(planning.visited) ]], :column_widths => [125,175,100,100])
        end
      end
    else
      @plannings.where(:user_id => @user).each do |planning|
        if planning.drugstore.present?
          table([[planning.user.username, planning.drugstore.name, planning.date_visit, visited_val(planning.visited) ]], :column_widths => [125,175,100,100])
        else
        table([[planning.user.username,"#{planning.doctor.firstname} #{planning.doctor.lastname} (#{planning.doctor.speciality})", planning.date_visit, visited_val(planning.visited) ]], :column_widths => [125,175,100,100])
        end
      end
    end

      # text "#{planning.doctor.firstname}"
      # table([[planning.user.username, "#{planning.doctor.firstname} #{planning.doctor.lastname}", planning.shift, planning.visited]], :column_widths => [100,100,100,100])

  end


  def visited_val(visita)
    visita == true ? "Si" : "No"
  end


end
