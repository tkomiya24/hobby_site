class MakeDrummerASubclass < ActiveRecord::Migration
  def up
    remove_column :drummers, :created_at
    remove_column :drummers, :updated_at
    remove_column :drummers, :proficiency
    remove_column :drummers, :experience
    remove_column :drummers, :background_vocals
    remove_column :drummers, :rating
    remove_reference :users, :drummer
  end

  def down
    add_column :drummers, :created_at, :datetime, null: false
    add_column :drummers, :updated_at, :datetime, null: false
    add_column :drummers, :proficiency, :string
    add_column :drummers, :experience, :integer, default: 0, null: false
    add_column :drummers, :background_vocals, :boolean, default: false, null: false
    add_column :drummers, :rating, :integer, default: 0
    add_reference :users, :drummer, index: true
  end
end
