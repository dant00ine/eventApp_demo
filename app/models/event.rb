class Event < ActiveRecord::Base
  belongs_to :user # => event owner
  has_many :members
  has_many :users, through: :members # => joining users
  has_many :comments, as: :commentable

  validates :title, :location, presence: true, length: {minimum: 5}

  geocoded_by :location
  after_validation :geocode

  def self.refreshData
      Event.all.each do |event|
          event[:location] = event[:location]
          event.save
      end
  end

end
