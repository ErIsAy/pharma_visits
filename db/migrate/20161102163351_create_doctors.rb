class CreateDoctors < ActiveRecord::Migration
  def change
    create_table :doctors do |t|
      t.string :firstname
      t.string :lastname
      t.string :speciality
      t.string :suite
      # takes the centers phone
      # t.string :phone
      t.string :phone_ext
      t.string :email
      t.date :birthday
      # t.string :center
      t.belongs_to :center, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
