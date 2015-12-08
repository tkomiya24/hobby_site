class Drummer < ActiveRecord::Base
  has_one :musical_hobby, as: :instrument, dependent: :destroy
  has_one :user, through: :musical_hobby
end
