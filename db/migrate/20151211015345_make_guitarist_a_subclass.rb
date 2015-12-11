class MakeGuitaristASubclass < ActiveRecord::Migration
  def up
    remove_column :guitarists, :created_at
    remove_column :guitarists, :updated_at
    remove_column :guitarists, :proficiency
    remove_column :guitarists, :experience
    remove_column :guitarists, :background_vocals
    remove_column :guitarists, :rating
    remove_reference :users, :guitarist
  end

  def down
    add_column :guitarists, :created_at, :datetime, null: false
    add_column :guitarists, :updated_at, :datetime, null: false
    add_column :guitarists, :proficiency, :string
    add_column :guitarists, :experience, :integer, default: 0, null: false
    add_column :guitarists, :background_vocals, :boolean, default: false, null: false
    add_column :guitarists, :rating, :integer, default: 0
    add_reference :users, :guitarist, index: true
  end
end
