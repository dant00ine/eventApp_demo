class User < ActiveRecord::Base
  has_secure_password
  has_many :members
  has_many :events, through: :members  # => Joining
  has_many :comments
  has_many :comments, as: :commentable

  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i

  validates :name, :email, :password, presence: true
  validates :email, uniqueness: {case_sensitive: false}, format: {with: EMAIL_REGEX}

  validates :name, :password, length: {minimum: 5}

  validates :age , numericality: {greater_than: 17}

  def self.ageFilter
    User.where("age >= 40").order(:age => :desc)
  end
end
