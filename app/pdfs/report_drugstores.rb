class ReportDrugstores < Prawn::Document
  def initialize(drugstores, city)
    super()
    image "public/logo_big.jpg", :scale => 0.1
    @drugstores = drugstores
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
    text "Listado de Farmacias", style: :italic
    text "Ciudad: #{@city}"
    text "Fecha de Reporte: #{Time.now.strftime("%F")}", :align => :right


  end


  def body
    table([["Farmacia","Dirección","Ciudad", "Teléfono"]], :column_widths => [100,200,100,100], :row_colors => ["9FA8DA"])

    @drugstores.each do |drugstore|
      table([[drugstore.name, drugstore.address, drugstore.city, drugstore.phone]], :column_widths => [100,200,100,100])
    end

  end



end
