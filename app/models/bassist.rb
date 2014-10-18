class Bassist < ActiveRecord::Base

	#associations
	belongs_to :user

	#validations
	validates :user_id, :presence => true
	validates :proficiency, :inclusion => {:in => [nil, 'Beginner', 'Intermmediate', 'Advanced', 'Professional']}
	validates :experience, :presence => true
	validates :background_vocals, :presence => true
	validates :six_string, :presence => true
	validates :five_string, :presence => true

end
