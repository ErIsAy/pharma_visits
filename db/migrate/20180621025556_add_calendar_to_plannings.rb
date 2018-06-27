class AddCalendarToPlannings < ActiveRecord::Migration
  def change
    add_column :plannings, :day, :integer
  end
end
