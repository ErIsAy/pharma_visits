class AddDivisionToUser < ActiveRecord::Migration
  def change
    add_reference :users, :division, index: true, foreign_key: true
  end
end
