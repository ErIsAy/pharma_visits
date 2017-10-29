class ReportDbc < Prawn::Document
  def initialize(doctors, center, user)
    super()
    image "public/logo_big.png", :scale => 0.4
    @doctors = doctors
    @center = center
    @user = user
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
    table([["Esp.","Nombre","Apellido","Cat.","Centro"]], :column_widths => [50,110,110,50,200], :row_colors => ["9FA8DA"])

    @doctors.where(:user_id => @user).each do |doctor|
      table([[doctor.speciality ,doctor.firstname, doctor.lastname, doctor.category ,doctor.center.name]], :column_widths => [50,110,110,50,200])
    end

  end



end
