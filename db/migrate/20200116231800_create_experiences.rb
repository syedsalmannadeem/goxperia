class CreateExperiences < ActiveRecord::Migration[6.0]
  def change
    create_table :experiences do |t|
      t.string :name
      t.integer :difficulty
      t.decimal :success
      t.integer :players_min
      t.integer :players_max
      t.integer :age_min
      t.integer :length_minutes
      t.text :excerpt
      t.text :description
      t.references :location, null: false, foreign_key: true

      t.timestamps
    end
  end
end
