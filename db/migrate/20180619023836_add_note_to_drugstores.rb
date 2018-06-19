class AddNoteToDrugstores < ActiveRecord::Migration
  def change
    add_column :drugstores, :note, :text
  end
end
