class CreatePlannings < ActiveRecord::Migration
  def change
    create_table :plannings do |t|
      t.string :title
      t.date :date_visit
      t.string :shift #AM/PM
      # t.datetime :end
      t.boolean :visited
      t.text :note

      t.belongs_to :user, index: true, foreign_key: true
      t.belongs_to :doctor, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
