class AddCategoryToDoctors < ActiveRecord::Migration
  def change
    add_column :doctors, :category, :string
  end
end
