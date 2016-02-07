class Musician < ActiveRecord::Base
  belongs_to :user
  actable
  validates :proficiency,
            inclusion: { in: [nil, 'Beginner', 'Intermmediate', 'Advanced', 'Professional'] }
  has_many :reviews, as: :reviewable, dependent: :delete_all
end
