class AddUserToCenters < ActiveRecord::Migration
  def change
    add_reference :centers, :user, index: true, foreign_key: true
  end
end
