class CreateMetricUploads < ActiveRecord::Migration
  def change
    create_table :metric_uploads do |t|
      t.string :name
      t.string :attachment

      t.timestamps null: false
    end
  end
end
