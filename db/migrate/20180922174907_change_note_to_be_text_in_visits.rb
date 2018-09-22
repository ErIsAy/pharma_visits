class ChangeNoteToBeTextInVisits < ActiveRecord::Migration
  def change
    change_column :visits, :note, :text
  end
end
