class Forum < ApplicationRecord
  validates :title, :user_id, presence: true
  has_many :comments
  belongs_to :user
end
