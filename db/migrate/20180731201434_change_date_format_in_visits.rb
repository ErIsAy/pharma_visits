class ChangeDateFormatInVisits < ActiveRecord::Migration
  def up
    change_column :visits, :date_visit, :datetime
  end

  def down
    change_column :visits, :date_visit, :date
  end
end
