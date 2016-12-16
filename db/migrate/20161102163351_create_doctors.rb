class CreateDoctors < ActiveRecord::Migration
  def change
    create_table :doctors do |t|
      t.string :firstname
      t.string :lastname
      t.string :speciality
      # t.string :center
      t.belongs_to :center, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
