class Report < ApplicationRecord
  belongs_to :user 
  has_many :tips
  has_many :comments
  has_many :likes
  has_many :destinations
  has_many :locations, through: :destinations
end
