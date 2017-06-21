class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  def create
    if params[:report]
        @comment = Comment.new(report_id: params[:id], text: params[:text], user_id: current_user.id)
        if @comment.save
          flash[:success] = "Your comment has been added"
          @report = Report.find_by(id: params[:id])
          redirect_to "/reports/#{params[:id]}"
        else
          flash[:warning] = "Comment not saved."
          redirect_to "/"
        end
    elsif params[:tip]
      @comment = Comment.new(tip_id: params[:id], text: params[:text], user_id: current_user.id)
        if @comment.save
          flash[:success] = "Your comment has been added"
          redirect_to "/"
        else
          flash[:warning] = "Comment not saved."
          redirect_to "/"
        end
    end
  end

end
