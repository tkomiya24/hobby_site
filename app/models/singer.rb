class Singer < ActiveRecord::Base
  has_one :user, dependent: :nullify

  # validations
  validates :proficiency, inclusion: { in: [nil, 'Beginner', 'Intermmediate', 'Advanced', 'Professional'] }
  validates :range, inclusion: { in: %w(Bass Baritone Tenor Alto Soprano) }
end
