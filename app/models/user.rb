class User < ActiveRecord::Base

	#security
	has_secure_password
	#validates :password_confirmation, :presence => true

	#validations
	EMAIL_REGEX = /\A[a-z0-9._%+-]+@[a-z0-9.0-]+\.[a-z]{2,4}\Z/i 
	validates :username, :uniqueness => true, :presence => true
	validates :email, :presence => true, :format => EMAIL_REGEX, :confirmation => true

	#associations
=begin 
	has_one :drummer
	has_one :guitarist
	has_one :bassist
=end
	belongs_to :drummer
	belongs_to :guitarist
	belongs_to :bassist

	def get_matches	

	end
end
