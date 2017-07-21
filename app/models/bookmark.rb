class Bookmark < ApplicationRecord
  
  belongs_to :user
  belongs_to :report, optional: true
  belongs_to :tip, optional: true
  belongs_to :question, optional: true
end
