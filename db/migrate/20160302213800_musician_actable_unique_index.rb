class MusicianActableUniqueIndex < ActiveRecord::Migration
  def change
    add_index(:musicians, [:user_id, :actable_type], unique: true)
  end
end
