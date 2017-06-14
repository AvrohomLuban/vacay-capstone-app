class CommentsController < ApplicationController

  def create
    @comment = Comment.create(report_id: params[:id], text: params[:text], user_id: current_user.id)
    flash[:success] = "Your comment has been added"
    @report = Report.find_by(id: params[:id])
    redirect_to "/reports/#{params[:id]}"
  end

end
