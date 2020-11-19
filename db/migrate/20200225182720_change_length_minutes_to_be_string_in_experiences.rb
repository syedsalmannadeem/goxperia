class ChangeLengthMinutesToBeStringInExperiences < ActiveRecord::Migration[6.0]
  def up
    change_column :experiences, :length_minutes, :string
  end

  def down
    change_column :experiences, :length_minutes, :integer
  end
end
