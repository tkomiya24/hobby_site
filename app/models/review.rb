class Review < ActiveRecord::Base
  belongs_to :reviewable, polymorphic: true
  belongs_to :user
  validates :rating, inclusion: 0..5

  validates :user_id, uniqueness: { scope: [:reviewable_id, :reviewable_type] }
end
