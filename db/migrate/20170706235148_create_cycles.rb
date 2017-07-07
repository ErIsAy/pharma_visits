class CreateCycles < ActiveRecord::Migration
  def change
    create_table :cycles do |t|
      t.string :name
      t.date :period

      t.timestamps null: false
    end
  end
end
