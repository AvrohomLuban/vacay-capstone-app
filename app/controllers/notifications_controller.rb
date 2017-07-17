class NotificationsController < ApplicationController
  def index
    @notifications_reports = Notification.all.where(user_id: current_user.id, tip_id: nil, question_id: nil, answer_id: nil, read: false)
    @notifications_questions = Notification.all.where(user_id: current_user.id, report_id: nil, tip_id: nil, comment_id: nil ,read:false)
    @notifications_answers = Notification.all.where(user_id: current_user.id, report_id: nil, tip_id: nil,read:false)
    render "index.html.erb"
  end
end
