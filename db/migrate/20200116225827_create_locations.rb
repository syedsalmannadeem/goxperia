class CreateLocations < ActiveRecord::Migration[6.0]
  def change
    create_table :locations do |t|
      t.string :company_name
      t.string :location_name
      t.string :city
      t.string :state
      t.integer :zip
      t.string :address
      t.string :phone
      t.string :email
      t.string :website

      t.timestamps
    end
  end
end
