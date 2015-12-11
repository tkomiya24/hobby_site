class ReviewRefactor < ActiveRecord::Migration
  def up
    remove_column :reviews, :reviewee_id
    remove_column :reviews, :reviewer_id
    add_reference :reviews, :user, index: true, null: false
    add_reference :reviews, :reviewable, polymorphic: true, index: true, null: false
  end

  def down
    add_column :reviews, :reviewee_id, :integer, null: false
    add_column :reviews, :reviewer_id, :integer, null: false
    remove_reference :reviews, :user
    remove_reference :reviews, :reviewable, polymorphic: true
  end
end
