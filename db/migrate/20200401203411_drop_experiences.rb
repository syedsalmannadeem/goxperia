class DropExperiences < ActiveRecord::Migration[6.0]
  def change
    remove_reference :experiences, :location, index: true, foreign_key: true
    drop_table :experiences do |t|
      t.string "name"
      t.integer "difficulty"
      t.decimal "success"
      t.integer "players_min"
      t.integer "players_max"
      t.integer "age_min"
      t.string "length"
      t.text "excerpt"
      t.text "description"
      t.bigint "location_id", null: false
      t.datetime "created_at", precision: 6, null: false
      t.datetime "updated_at", precision: 6, null: false
      t.index ["location_id"], name: "index_experiences_on_location_id"
    end
  end
end
