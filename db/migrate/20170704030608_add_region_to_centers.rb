class AddRegionToCenters < ActiveRecord::Migration
  def change
    add_column :centers, :region, :string
  end
end
