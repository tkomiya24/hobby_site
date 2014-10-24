class Singer < ActiveRecord::Base

	#relations
	has_one :user, :dependent => :nullify

	#validations 
	validates :proficiency, :inclusion => {:in => [nil, 'Beginner', 'Intermmediate', 'Advanced', 'Professional']}
	validates :range, :inclusion => {:in => ['Bass', 'Baritone', 'Tenor', 'Alto','Soprano']}

end
