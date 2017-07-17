class Answer < ApplicationRecord
  belongs_to :question
  belongs_to :user
  has_many :likes
  has_many :comments
  has_many :notifications
end
