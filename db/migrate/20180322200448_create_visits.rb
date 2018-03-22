class CreateVisits < ActiveRecord::Migration
  def change
    create_table :visits do |t|
      t.string :note
      t.date :date_visit
      t.belongs_to :planning, index: true, foreign_key: true
      t.belongs_to :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
