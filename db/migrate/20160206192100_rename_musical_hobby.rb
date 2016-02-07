class RenameMusicalHobby < ActiveRecord::Migration
  def up
    rename_table :musical_hobbies, :musicians
  end

  def down
    rename_table :musicians, :musical_hobbies
  end
end
