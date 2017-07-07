class AddCycleIdToPlannings < ActiveRecord::Migration
  def change
    add_reference :plannings, :cycle, index: true, foreign_key: true
  end
end
