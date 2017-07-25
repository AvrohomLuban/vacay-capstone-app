class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  def create
    if params[:report]
        @comment = Comment.new(report_id: params[:id], text: params[:text], user_id: current_user.id)
        if @comment.save
          flash[:success] = "Your comment has been added"
          @report = Report.find_by(id: params[:id])
          notification = Notification.create(user_id: @report.user_id, comment_id: @comment.id, report_id: @report.id)
          redirect_to "/reports/#{params[:id]}"
        else
          flash[:warning] = "Comment not saved."
          redirect_to "/"
        end
    elsif params[:tip]
      @comment = Comment.new(tip_id: params[:id], text: params[:text], user_id: current_user.id)
        if @comment.save
          flash[:success] = "Your comment has been added"
          @tip = Tip.find_by(id: params[:id])
          notification = Notification.create(user_id: @tip.user_id, comment_id: @comment.id, tip_id: @tip.id)
          redirect_to(:back)
        else
          flash[:warning] = "Comment not saved."
          redirect_to "/"
        end
    elsif params[:answer]
      @comment = Comment.new(answer_id: params[:id], text: params[:text], user_id: current_user.id)
      if @comment.save
        flash[:success] = "Your comment has been added"
        @answer = Answer.find_by(id: params[:id])
          notification = Notification.create(user_id: @answer.user_id, comment_id: @comment.id, question_id: @comment.answer.question.id, answer_id: @answer.id)
        redirect_to(:back)
      else
        flash[:warning] = "Comment could not be saved"
        redirect_to "/questions"
      end
    end
  end

end
