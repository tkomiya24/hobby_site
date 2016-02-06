class Musician < ActiveRecord::Base
  belongs_to :user
  belongs_to :instrument, polymorphic: true
  validates :proficiency,
            inclusion: { in: [nil, 'Beginner', 'Intermmediate', 'Advanced', 'Professional'] }
  has_one :review, as: :reviewable, dependent: :delete
end
