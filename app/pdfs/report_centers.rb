class ReportCenters < Prawn::Document
  def initialize(centers, city, user, params)
    super()
    image "public/logo_big.png", :scale => 0.4
    @params = params
    @centers = centers
    @user = user
    if city == ""
      @city = "Todas"
    else
      @city = city
    end
    move_down 20
    header
    move_down 10
    body

  end

  def header
    text "Listado de Centros", style: :italic
    # text "Ciudad: #{@city}"
    text "Fecha de Reporte: #{Time.now.strftime("%F")}", :align => :right
    move_down 5

    text "Ciudad: #{@params["city_cont"]}"
    text "Región: #{@params["region_cont"]}"
    text "Usuario: #{@params["user_username_eq"]}"


  end


  def body
    table([["Centro","Región","Dirección","Ciudad"]], :column_widths => [100,80,220,100], :row_colors => ["9FA8DA"])

    if @user.admin
      @centers.each do |center|
        table([[center.name, center.region, center.address, center.city]], :column_widths => [100,80,220,100])
      end  
    else
      @centers.where(:user_id => @user).each do |center|
        table([[center.name, center.region, center.address, center.city]], :column_widths => [100,80,220,100])      
      end
    end

  end



end
