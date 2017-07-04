class ReportDoctors < Prawn::Document
  def initialize(doctors)
    super()
    image "public/logo_big.png", :scale => 0.4
    @doctors = doctors
    move_down 20
    header
    move_down 10
    body

  end

  def header
    text "Listado de Doctores", style: :italic
    text "Fecha de Reporte: #{Time.now.strftime("%F")}", :align => :right


  end


  def body
    table([["Esp.","Nombre","Apellido","Cat.","Centro"]], :column_widths => [50,100,100,50,200], :row_colors => ["9FA8DA"])

    @doctors.each do |doctor|
      table([[doctor.speciality, doctor.firstname, doctor.lastname, doctor.category, doctor.center.name]], :column_widths => [50,100,100,50,200])
    end

  end



end
