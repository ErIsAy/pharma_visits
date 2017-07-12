class AddEjeIdToDivisions < ActiveRecord::Migration
  def change
    add_reference :divisions, :eje, index: true, foreign_key: true
  end
end
