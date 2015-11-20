class User < ActiveRecord::Base
  # security
  has_secure_password
  # validates :password_confirmation, :presence => true

  # validations
  EMAIL_REGEX = /\A[a-z0-9._%+-]+@[a-z0-9.0-]+\.[a-z]{2,4}\Z/i
  validates :username, uniqueness: true, presence: true
  validates :email, presence: true, format: EMAIL_REGEX, confirmation: true

  # associations
  belongs_to :drummer
  belongs_to :guitarist
  belongs_to :bassist
  belongs_to :singer
  has_many :received_reviews, class_name: 'Review', foreign_key: 'reviewee_id'
  has_many :written_reviews, class_name: 'Review', foreign_key: 'reviewee_id'

  def get_matches(limit)
    User.where(['CITY = ? AND '\
                '(drummer_id IS NOT NULL OR '\
                'guitarist_id IS NOT NULL OR '\
                'bassist_id IS NOT NULL)', city]).where.not(id: id).limit(limit)
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
    !drummer.nil? || !guitarist.nil? || !bassist.nil? || !singer.nil?
  end

  # rubocop:disable Lint/UselessAssignment
  def nullify_deleted
    drummer_id = nil if drummer.nil?
    bassist_id = nil if bassist.nil?
    guitarist_id = nil if guitarist.nil?
    save
  end
  # rubocop:enable Lint/UselessAssignment
end
