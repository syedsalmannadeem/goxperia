class AddMetroAreaToLocations < ActiveRecord::Migration[6.0]
  def change
    add_column :locations, :metro_area, :bigint
  end
end
