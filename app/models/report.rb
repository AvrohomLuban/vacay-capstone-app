class Report < ApplicationRecord
  validates :title, :season, :duration, :text, :user_id, presence: true

  belongs_to :user 
  has_many :comments
  has_many :likes
  has_many :destinations
  has_many :locations, through: :destinations
  has_many :images
  has_many :photos
  has_many :bookmarks
end
