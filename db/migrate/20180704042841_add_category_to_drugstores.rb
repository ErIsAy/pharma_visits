class AddCategoryToDrugstores < ActiveRecord::Migration
  def change
    add_column :drugstores, :category, :string
  end
end
