class Singer < ActiveRecord::Base
  has_one :user, dependent: :nullify
  validates :range, inclusion: { in: %w(Bass Baritone Tenor Alto Soprano) }
end
