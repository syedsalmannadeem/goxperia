class AddCategoryToLocations < ActiveRecord::Migration[6.0]
  def change
    add_column :locations, :category, :bigint
  end
end
