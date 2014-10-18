class Drummer < ActiveRecord::Base

	#associations
	belongs_to :user

	#validations
	validates :user_id, :presence => true
	validates :proficiency, :inclusion => {:in => [nil, 'Beginner', 'Intermmediate', 'Advanced', 'Professional']}
	validates :experience, :presence => true
	validates :double_kick, :presence => true
	validates :background_vocals, :presence => true

end
