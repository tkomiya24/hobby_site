class MusicalHobby < ActiveRecord::Base
  belongs_to :user
  belongs_to :instrument, polymorphic: true
end
