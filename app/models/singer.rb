class Singer < ActiveRecord::Base
  validates :range, inclusion: { in: %w(Bass Baritone Tenor Alto Soprano) }
  acts_as :musician
end
