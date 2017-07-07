class ReportMetrics < Prawn::Document
  include ActionView::Helpers::NumberHelper

  def initialize(plannings, cycle)
    super()
    image "public/logo_big.png", :scale => 0.4
    @plannings = plannings
    @cycle = cycle
    move_down 20
    header
    move_down 10
    body

  end

  def header
    text "Reporte de Métricas", style: :italic
    text "Período: #{Cycle.find(@cycle).name}"
    text "Fecha de Reporte: #{Time.now.strftime("%F")}", :align => :right


  end


  def body
    table([["Usuario","Visitas Planeadas","Visitas Realizadas","% Métrica"]], :column_widths => [100,150,150,100], :row_colors => ["9FA8DA"])

    @plannings.each do |planning|
      # text "#{planning.doctor.firstname}"
      table([[planning.user.username,
              Planning.joins(:cycle).where(:user_id => planning.user.id,cycles: {id: @cycle}).count,
              Planning.joins(:cycle).where(:user_id => planning.user.id,:visited => true, cycles: {id: @cycle}).count,
              number_to_percentage((planning.user.plannings.where(:visited => true).count.to_f / planning.user.plannings.count.to_f)*100, precision: 0)

              ]], :column_widths => [100,150,150,100])

      # # table([[planning.user.username, "#{planning.doctor.firstname} #{planning.doctor.lastname}", planning.shift, planning.visited]], :column_widths => [100,100,100,100])

    end

  end




end
