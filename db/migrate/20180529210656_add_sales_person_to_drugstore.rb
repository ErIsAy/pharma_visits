class AddSalesPersonToDrugstore < ActiveRecord::Migration
  def change
    add_column :drugstores, :sales_person, :string
  end
end
