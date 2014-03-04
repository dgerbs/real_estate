class AddBuildingIdToOwners < ActiveRecord::Migration
  def change
    add_column :owners, :building_id, :integer
  end
end
