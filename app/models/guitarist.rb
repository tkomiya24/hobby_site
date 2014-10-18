class Guitarist < ActiveRecord::Base

	#associations
	belongs_to :user

	#validations
	validates :user_id, :presence => true
	validates :proficiency, :inclusion => {:in => [nil, 'Beginner', 'Intermmediate', 'Advanced', 'Professional']}
	validates :rhythm_or_lead, :inclusion => {:in => ['Rhythm', 'Lead', 'Both']},
							   :presence => true
	validates :experience, :presence => true
	validates :background_vocals, :presence => true

end
