class User < ActiveRecord::Base
  # security
  has_secure_password
  # validates :password_confirmation, :presence => true

  # validations
  EMAIL_REGEX = /\A[a-z0-9._%+-]+@[a-z0-9.0-]+\.[a-z]{2,4}\Z/i
  validates :username, uniqueness: true, presence: true
  validates :email, uniqueness: true, presence: true, format: EMAIL_REGEX
  has_many :reviews
  has_many :musicians, dependent: :destroy
  has_many :reviewed_musician, class_name: 'Musician', through: :reviews

  def instrument?(instrument)
    musicians.any? { |musician| musician.actable_type.downcase == instrument }
  end

  def singer?
    instrument?('singer')
  end

  def guitarist?
    instrument?('guitarist')
  end

  def bassist?
    instrument?('bassist')
  end

  def drummer?
    instrument?('drummer')
  end

  def guitarist
    instrument('guitarist')
  end

  def drummer
    instrument('drummer')
  end

  def bassist
    instrument('bassist')
  end

  def singer
    instrument('singer')
  end

  def reviewed_musician?(musician)
    musician.reviews.any? { |review| review.user.id == id }
  end

  def more_instrument_options?
    !(bassist? && singer? && drummer? && guitarist?)
  end

  private

  def instrument(instrument)
    musicians.find { |musician| musician.actable_type.downcase == instrument }.specific
  end
end
