class User < ActiveRecord::Base
  # security
  has_secure_password
  # validates :password_confirmation, :presence => true

  # validations
  EMAIL_REGEX = /\A[a-z0-9._%+-]+@[a-z0-9.0-]+\.[a-z]{2,4}\Z/i
  validates :username, uniqueness: true, presence: true
  validates :email, presence: true, format: EMAIL_REGEX, confirmation: true
  has_many :received_reviews, class_name: 'Review', foreign_key: 'reviewee_id'
  has_many :written_reviews, class_name: 'Review', foreign_key: 'reviewee_id'

  has_many :musical_hobbies

  def get_matches(*)
    []
  end

  def guitarist?
    plays_instrument?('Guitarist')
  end

  def singer?
    plays_instrument?('Singer')
  end

  def drummer?
    plays_instrument?('Drummer')
  end

  def bassist?
    plays_instrument?('Bassist')
  end

  def plays_instrument?(instrument)
    musical_hobbies.each do |hobby|
      return true if hobby.instrument_type == instrument
    end
    false
  end

  def drummer
    instrument('Drummer')
  end

  def singer
    instrument('Singer')
  end

  def bassist
    instrument('Bassist')
  end

  def guitarist
    instrument('Guitarist')
  end

  def instrument(instrument)
    musical_hobbies.each do |hobby|
      return hobby.instrument if hobby.instrument_type == instrument
    end
  end

  def get_drummers(limit)
    User.where(city: city).where.not(id: id, drummer_id: nil).limit(limit)
  end

  def get_guitarists(limit)
    User.where(city: city).where.not(id: id, guitarist_id: nil).limit(limit)
  end

  def get_bassists(limit)
    User.where(city: city).where.not(id: id, bassist_id: nil).limit(limit)
  end

  def musician?
    musical_hobbies.size > 1
  end
end
