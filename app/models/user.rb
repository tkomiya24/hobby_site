class User < ActiveRecord::Base
  # security
  has_secure_password
  # validates :password_confirmation, :presence => true

  # validations
  EMAIL_REGEX = /\A[a-z0-9._%+-]+@[a-z0-9.0-]+\.[a-z]{2,4}\Z/i
  validates :username, uniqueness: true, presence: true
  validates :email, presence: true, format: EMAIL_REGEX, confirmation: true
  has_many :written_reviews, class_name: 'Review'
  has_many :musicians, dependent: :destroy

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
    instrument('guitarist').becomes(Guitarist)
  end

  def drummer
    instrument('drummer').becomes(Drummer)
  end

  private

  def instrument?(instrument)
    musicians.any? { |musician| musician.actable_type.downcase == instrument }
  end

  def instrument(instrument)
    musicians.find { |musician| musician.actable_type.downcase == instrument }
  end
end
