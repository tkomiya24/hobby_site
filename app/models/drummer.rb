class Drummer < ActiveRecord::Base

	#associations
	#belongs_to :user
	has_one :user

	#validations
	#validates :user_id, :presence => true
	validates :proficiency, :inclusion => {:in => [nil, 'Beginner', 'Intermmediate', 'Advanced', 'Professional']}

end
