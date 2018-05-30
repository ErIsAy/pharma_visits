class ReportDbc < Prawn::Document
  def initialize(doctors, center, user, params)
    super()
    image "public/logo_big.png", :scale => 0.4
    @params = params
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


    text "Centro: #{@params["center_name_cont"]}"
    text "Categoria: #{@params["category_eq"]}"
    text "Usuario: #{@params["user_username_eq"]}"

  end


  def body
    table([["Esp.","Nombre","Apellido","Cat.","Centro"]], :column_widths => [50,110,110,50,200], :row_colors => ["9FA8DA"])

    if @user.admin
      @doctors.each do |doctor|
        table([[doctor.speciality ,doctor.firstname, doctor.lastname, doctor.category ,doctor.center.name]], :column_widths => [50,110,110,50,200])
      end
    else
      @doctors.where(:user_id => @user).each do |doctor|
        table([[doctor.speciality ,doctor.firstname, doctor.lastname, doctor.category ,doctor.center.name]], :column_widths => [50,110,110,50,200])
      end
    end


  end



end
