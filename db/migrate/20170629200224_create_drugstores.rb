class CreateDrugstores < ActiveRecord::Migration
  def change
    create_table :drugstores do |t|
      t.string :name
      t.string :phone
      t.string :address
      t.string :city

      t.timestamps null: false
    end
  end
end
