class ChangeVisitedDefault < ActiveRecord::Migration
  def up
    change_column_default :plannings, :visited, false
  end
  def down
    change_column_default :plannings, :visited, nil
  end
end
