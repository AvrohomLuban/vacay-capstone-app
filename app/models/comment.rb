class Comment < ApplicationRecord
  validates :text, presence: true

  belongs_to :tip, optional: true
  belongs_to :report, optional: true
  belongs_to :user, optional: true
end
