class Event < ActiveRecord::Base
  belongs_to :user # => event owner
  has_many :members
  has_many :users, through: :members # => joining users

  validates :title, :place, presence: true, length: {minimum: 5}
end
