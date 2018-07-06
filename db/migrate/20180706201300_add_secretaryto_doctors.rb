class AddSecretarytoDoctors < ActiveRecord::Migration
  def change
    add_column :doctors, :sec_name, :string
    add_column :doctors, :sec_phone, :string
  end
end
