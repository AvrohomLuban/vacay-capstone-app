class Comment < ApplicationRecord
  belongs_to :tip, optional: true
  belongs_to :report, optional: true
  belongs_to :user, optional: true
end
