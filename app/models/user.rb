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

	def get_matches(limit)
		return User.where(["CITY = ? AND (drummer_id IS NOT NULL OR guitarist_id IS NOT NULL OR bassist_id IS NOT NULL)", self.city]).
		where.not(:id => self.id)
	end

	def get_drummers(limit)
		return User.where(:city => self.city).where.not(:id => self.id, :drummer_id => nil).limit(limit)
	end

	def get_guitarists(limit)
		return User.where(:city => self.city).where.not(:id => self.id, :guitarist_id => nil).limit(limit)
	end

	def get_bassists(limit)
		return User.where(:city => self.city).where.not(:id => self.id, :bassist_id => nil).limit(limit)
	end

end
