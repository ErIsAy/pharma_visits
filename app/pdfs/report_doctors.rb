class ReportDoctors < Prawn::Document
  def initialize(doctors, user, params)
    super()
    image "public/logo_big.png", :scale => 0.4
    @params = params
    @doctors = doctors
    @user = user
    if @params["center_city_eq"] == ""
      @city = 'Todas'
    else 
      @city = @params["center_city_eq"]
    end
    move_down 20
    header
    move_down 10
    body

  end

  def header
    text "Listado de Doctores", style: :italic
    text "Fecha de Reporte: #{Time.now.strftime("%F")}", :align => :right

    text "Especialidad: #{@params["speciality_eq"]}"
    text "Centro: #{@params["center_name_cont"]}"
    text "Ciudad: #{@city}"
    text "Categoria: #{@params["category_eq"]}"
    text "Usuario: #{@params["user_username_eq"]}"


  end


  def body
    table([["Esp.","Nombre","Apellido","Cat.","Centro"]], :column_widths => [50,100,100,50,200], :row_colors => ["9FA8DA"])

    if @user.admin
      @doctors.each do |doctor|
        table([[doctor.speciality, doctor.firstname, doctor.lastname, doctor.category, doctor.center.name]], :column_widths => [50,100,100,50,200])
      end
    else
      @doctors.where(:user_id => @user).each do |doctor|
        table([[doctor.speciality, doctor.firstname, doctor.lastname, doctor.category, doctor.center.name]], :column_widths => [50,100,100,50,200])
      end
    end


  end



end
