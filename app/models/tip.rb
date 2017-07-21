class Tip < ApplicationRecord
  validates :text, :user_id, :location_id, :venue, presence: true
  belongs_to :user
  belongs_to :location
  has_many :likes
  has_many :comments
  has_many :destination
  has_many :images
  has_many :photos
  has_many :bookmarks
  has_many :notifications
end
