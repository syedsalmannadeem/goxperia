class AddFeaturedToLocations < ActiveRecord::Migration[6.0]
  def change
    add_column :locations, :featured, :boolean
  end
end
