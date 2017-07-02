class ReportDbc < Prawn::Document
  def initialize(doctors, center)
    super()
    image "public/logo_big.jpg", :scale => 0.1
    @doctors = doctors
    @center = center
    move_down 20
    header
    move_down 10
    body

  end

  def header
    text "Listado de Doctores por Centro", style: :italic
    text "Centro: #{@center}"
    text "Fecha de Reporte: #{Time.now.strftime("%F")}", :align => :right


  end


  def body
    table([["Nombre","Apellido","Centro"]], :column_widths => [166,166,166], :row_colors => ["9FA8DA"])

    @doctors.each do |doctor|
      table([[doctor.firstname, doctor.lastname, doctor.center.name]], :column_widths => [166,166,166])
    end

  end



end
