class Tip < ApplicationRecord
  belongs_to :user
  belongs_to :location
  has_many :likes
  has_many :comments
  has_many :destination
end
