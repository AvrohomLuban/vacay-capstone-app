class Tip < ApplicationRecord
  belongs_to :user
  belongs_to :report
  has_many :likes
  has_many :comments
  has_many :destination
  belongs_to :location
end
