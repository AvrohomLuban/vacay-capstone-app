class Question < ApplicationRecord
  validates :location_id, :user_id, :question, presence: true
  belongs_to :user
  belongs_to :location
  has_many :answers
  has_many :bookmarks
  has_many :likes
  has_many :notifications
end
