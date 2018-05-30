class ReportDrugstores < Prawn::Document
  def initialize(drugstores, city, params)
    super()
    image "public/logo_big.png", :scale => 0.4
    @params = params
    @drugstores = drugstores
    # if city == ""
    #   @city = "Todas"
    # else
    #   @city = city
    # end
    if @params["city_cont"] == ""
      @city = 'Todas'
    else 
      @city = @params["city_cont"]
    end
    if @params["user_username_eq"] == ""
      @users = 'Todos'
    else 
      @users = @params["user_username_eq"]
    end
    # byebug
    move_down 20
    header
    move_down 10
    body

  end

  def header
    text "Listado de Farmacias", style: :italic
    text "Fecha de Reporte: #{Time.now.strftime("%F")}", :align => :right
    text "Ciudad: #{@city}"
    text "Usuario: #{@users}"


  end


  def body
    table([["Farmacia","Dirección","Ciudad", "Teléfono", "Encargado"]], :column_widths => [100,180,75,70,75], :row_colors => ["9FA8DA"])

    @drugstores.each do |drugstore|
      table([[drugstore.name, drugstore.address, drugstore.city, drugstore.phone, drugstore.service_person]], :column_widths => [100,180,75,70,75])
    end

  end



end
