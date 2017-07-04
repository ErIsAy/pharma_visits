class ReportPlannings < Prawn::Document
  def initialize(plannings, user)
    super()
    image "public/logo_big.png", :scale => 0.4
    @plannings = plannings
    # @user = user
    if user == ""
      @user = "Todos"
    else
      @user = user
    end
    move_down 20
    header
    move_down 10
    body

  end

  def header
    text "Reporte de Plan por Visitador", style: :italic
    text "Usuario: #{@user}"
    text "Fecha de Reporte: #{Time.now.strftime("%F")}", :align => :right


  end


  def body
    table([["Usuario","Doctor","Fecha","Tanda","Visitado(Si/No)"]], :column_widths => [100,100,100,100,100], :row_colors => ["9FA8DA"])

    @plannings.each do |planning|
      # text "#{planning.doctor.firstname}"
      table([[planning.user.username, planning.doctor.firstname, planning.date_visit ,planning.shift, visited_val(planning.visited) ]], :column_widths => [100,100,100,100,100])

      # # table([[planning.user.username, "#{planning.doctor.firstname} #{planning.doctor.lastname}", planning.shift, planning.visited]], :column_widths => [100,100,100,100])

    end

  end


  def visited_val(visita)
    visita == true ? "Si" : "No"
  end


end
