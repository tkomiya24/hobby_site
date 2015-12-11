class Singer < ActiveRecord::Base
  validates :range, inclusion: { in: %w(Bass Baritone Tenor Alto Soprano) }
  has_one :musical_hobby, as: :instrument, dependent: :destroy, inverse_of: :instrument
  has_one :user, through: :musical_hobby
  accepts_nested_attributes_for :musical_hobby, update_only: true
end
