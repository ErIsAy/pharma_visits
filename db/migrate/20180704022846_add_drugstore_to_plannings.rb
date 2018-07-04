class AddDrugstoreToPlannings < ActiveRecord::Migration
  def change
    add_reference :plannings, :drugstore, index: true, foreign_key: true
  end
end
