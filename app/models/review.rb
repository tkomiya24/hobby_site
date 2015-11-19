class Review < ActiveRecord::Base
  belongs_to :reviewer, class_name: 'User'
  belongs_to :reviewer, class_name: 'User'

  validates :reviewer_id, uniqueness: { scope: [:reviewee_id] }
  validates :rating, inclusion: 0..5
end
