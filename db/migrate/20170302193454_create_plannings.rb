class CreatePlannings < ActiveRecord::Migration
  def change
    create_table :plannings do |t|
      t.string :title
      t.datetime :start
      t.datetime :end
      t.boolean :visited
      t.text :note

      t.timestamps null: false
    end
  end
end
