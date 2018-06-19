class AddCategoryToCenters < ActiveRecord::Migration
  def change
    add_column :centers, :category, :string
  end
end
