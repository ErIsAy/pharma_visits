class CreateCenters < ActiveRecord::Migration
  def change
    create_table :centers do |t|
      t.string :name
      t.string :address
      t.string :city

      t.timestamps null: false
    end
  end
end
