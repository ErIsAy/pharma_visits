class CreateEjes < ActiveRecord::Migration
  def change
    create_table :ejes do |t|
      t.string :name
      t.belongs_to :division, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
