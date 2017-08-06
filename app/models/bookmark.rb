class Bookmark < ApplicationRecord
  validates_uniqueness_of :user_id, :scope => [:report_id, :tip_id, :question_id]
  
  belongs_to :user
  belongs_to :report, optional: true
  belongs_to :tip, optional: true
  belongs_to :question, optional: true

end
