class Question < ApplicationRecord
  belongs_to :user
  belongs_to :location
  has_many :answers
  has_many :bookmarks
end
