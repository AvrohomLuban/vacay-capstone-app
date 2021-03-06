class NotificationsController < ApplicationController
  def index
    @notifications_reports = Notification.all.where(user_id: current_user.id, tip_id: nil, question_id: nil, answer_id: nil, read: false)
    @notifications_questions = Notification.all.where(user_id: current_user.id, report_id: nil, tip_id: nil, comment_id: nil ,read:false)
    @notifications_answers = Notification.all.where(user_id: current_user.id, report_id: nil, tip_id: nil, read:false).where.not('comment_id' => nil)
    @notifications_tips = Notification.all.where(user_id: current_user.id, question_id: nil, report_id: nil).where.not('comment_id' => nil, 'tip_id' => nil)
    render "index_v2.html.erb"
  end

  def destroy
    if params[:user]
      notification = Notification.where(user_id: current_user.id)
      notification.destroy_all
      flash[:warning] = "All notifications have been cleared."
    else
    notification = Notification.find_by(id: params[:id])
    notification.destroy
    flash[:warning] = "Notification has been removed"
    end
    redirect_to "/notifications"
  end
end
