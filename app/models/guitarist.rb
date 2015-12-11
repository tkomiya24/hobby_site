class Guitarist < ActiveRecord::Base
  has_one :musical_hobby, as: :instrument, dependent: :destroy, inverse_of: :instrument
  has_one :user, through: :musical_hobby
  accepts_nested_attributes_for :musical_hobby, update_only: true
  validates :rhythm_or_lead, inclusion: { in: %w(Rhythm Lead Both) }
end
