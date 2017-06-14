class Like < ApplicationRecord
  belongs_to :tip
  belongs_to :report
  belongs_to :user
end
