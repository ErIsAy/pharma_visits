class ReportPlannings < Prawn::Document
  def initialize(plannings, user)
    super()
    image "public/logo_big.png", :scale => 0.4
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


  end


  def body
    table([["Usuario","Doctor","Fecha","Tanda","Visitado"]], :column_widths => [100,100,100,100,100], :row_colors => ["9FA8DA"])


    if @user.admin
      @plannings.each do |planning|
        table([[planning.user.username, planning.doctor.firstname, planning.date_visit ,planning.shift, visited_val(planning.visited) ]], :column_widths => [100,100,100,100,100])
      end
    else
      @plannings.where(:user_id => @user).each do |planning|
        table([[planning.user.username, planning.doctor.firstname, planning.date_visit ,planning.shift, visited_val(planning.visited) ]], :column_widths => [100,100,100,100,100])
      end
    end

      # text "#{planning.doctor.firstname}"
      # table([[planning.user.username, "#{planning.doctor.firstname} #{planning.doctor.lastname}", planning.shift, planning.visited]], :column_widths => [100,100,100,100])

  end


  def visited_val(visita)
    visita == true ? "Si" : "No"
  end


end
