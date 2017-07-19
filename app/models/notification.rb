class Notification < ApplicationRecord
  belongs_to :user
  belongs_to :comment, optional: true
  belongs_to :answer, optional: true
  belongs_to :question, optional:true
  belongs_to :tip, optional:true
  belongs_to :report, optional:true
end

def self.badge
   var count = Notification.where(user_id: current_user.id).count
   return count
end