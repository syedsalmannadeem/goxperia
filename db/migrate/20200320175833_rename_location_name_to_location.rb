class RenameLocationNameToLocation < ActiveRecord::Migration[6.0]
  def change
    rename_column :locations, :location_name, :name
  end
end