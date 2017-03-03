class CreatePlannings < ActiveRecord::Migration
  def change
    create_table :plannings do |t|
      t.string :title
      t.date :date_visit
      t.string :shift #AM/PM
      # t.datetime :end
      t.boolean :visited
      t.text :note

      t.timestamps null: false
    end
  end
end
