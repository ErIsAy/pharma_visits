class ReportCenters < Prawn::Document
  def initialize(centers, city)
    super()
    image "public/logo_big.jpg", :scale => 0.1
    @centers = centers
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
    text "Ciudad: #{@city}"
    text "Fecha de Reporte: #{Time.now.strftime("%F")}", :align => :right


  end


  def body
    table([["Centro","Dirección","Ciudad"]], :column_widths => [100,300,100], :row_colors => ["9FA8DA"])

    @centers.each do |center|
      table([[center.name, center.address, center.city]], :column_widths => [100,300,100])
    end

  end



end
