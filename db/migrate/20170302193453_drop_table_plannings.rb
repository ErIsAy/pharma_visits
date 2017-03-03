class DropTablePlannings < ActiveRecord::Migration
  def change
    drop_table :plannings
  end
end
