class Musician < ActiveRecord::Base
  belongs_to :user
  actable
  validates :proficiency,
            inclusion: { in: [nil, 'Beginner', 'Intermmediate', 'Advanced', 'Professional'] }
  has_many :reviews, as: :reviewable, dependent: :delete_all
  has_many :reviewers, class_name: 'User', through: :reviews

  def review_from(user)
    reviews.find { |review| review.user == user }
  end
end
