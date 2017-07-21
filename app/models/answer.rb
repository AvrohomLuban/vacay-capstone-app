class Answer < ApplicationRecord
  validates :user_id, :question_id, :answer, presence: true
  belongs_to :question
  belongs_to :user
  has_many :likes
  has_many :comments
  has_many :notifications
end
