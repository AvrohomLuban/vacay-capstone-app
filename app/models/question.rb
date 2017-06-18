class Question < ApplicationRecord
  belongs_to :user
  belongs_to :location
  has_many :answers
end
