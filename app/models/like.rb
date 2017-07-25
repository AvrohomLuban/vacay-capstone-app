class Like < ApplicationRecord
  validates_uniqueness_of :user_id, :scope => [:report_id, :tip_id, :answer_id]
  # validates_uniqueness_of :user_id, :scope => :tip_id
  # validates_uniqueness_of :user_id, :scope => :answer_id


  belongs_to :tip , optional: true
  belongs_to :report, optional: true
  belongs_to :user
  belongs_to :answer, optional: true
end
