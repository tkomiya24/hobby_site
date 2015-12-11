class MakeBassistASubclass < ActiveRecord::Migration
  def up
    remove_column :bassists, :created_at
    remove_column :bassists, :updated_at
    remove_column :bassists, :proficiency
    remove_column :bassists, :experience
    remove_column :bassists, :background_vocals
    remove_column :bassists, :rating
    remove_reference :users, :bassist
  end

  def down
    add_column :bassists, :created_at, :datetime, null: false
    add_column :bassists, :updated_at, :datetime, null: false
    add_column :bassists, :proficiency, :string
    add_column :bassists, :experience, :integer, default: 0, null: false
    add_column :bassists, :background_vocals, :boolean, default: false, null: false
    add_column :bassists, :rating, :integer, default: 0
    add_reference :users, :bassist, index: true
  end
end
