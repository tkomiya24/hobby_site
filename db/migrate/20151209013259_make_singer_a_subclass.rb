class MakeSingerASubclass < ActiveRecord::Migration
  def up
    remove_column :singers, :created_at
    remove_column :singers, :updated_at
    remove_column :singers, :proficiency
    remove_column :singers, :experience
    remove_column :singers, :background_vocals
    remove_column :singers, :rating
    remove_reference :users, :singer
  end

  def down
    add_column :singers, :created_at, :datetime, null: false
    add_column :singers, :updated_at, :datetime, null: false
    add_column :singers, :proficiency, :string
    add_column :singers, :experience, :integer, default: 0, null: false
    add_column :singers, :background_vocals, :boolean, default: false, null: false
    add_column :singers, :rating, :integer, default: 0
    add_reference :users, :singer, index: true
  end
end
