class AddCycleToVisits < ActiveRecord::Migration
  def change
    add_column :visits, :cycle, :string
  end
end
