class ChangeLengthMinutesNameToLengthInExperiences < ActiveRecord::Migration[6.0]
  def up
    rename_column :experiences, :length_minutes, :length
  end

  def down
    rename_column :experiences, :length, :length_minutes
  end
end
