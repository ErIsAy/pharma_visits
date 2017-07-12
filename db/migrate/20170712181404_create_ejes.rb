class CreateEjes < ActiveRecord::Migration
  def change
    drop_table :ejes
    create_table :ejes do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
