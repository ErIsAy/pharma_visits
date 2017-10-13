class AddUserToDoctors < ActiveRecord::Migration
  def change
    add_reference :doctors, :user, index: true, foreign_key: true
  end
end
