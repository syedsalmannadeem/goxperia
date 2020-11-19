class RemoveMetroAreaFromLocations < ActiveRecord::Migration[6.0]
  def change
    remove_column :locations, :metro_area, :bigint
  end
end
