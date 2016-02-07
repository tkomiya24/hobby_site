class Guitarist < ActiveRecord::Base
  validates :rhythm_or_lead, inclusion: { in: %w(Rhythm Lead Both) }
  acts_as :musician
end
