class AddUserToDrugstores < ActiveRecord::Migration
  def change
    add_reference :drugstores, :user, index: true, foreign_key: true
  end
end
