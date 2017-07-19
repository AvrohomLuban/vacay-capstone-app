class LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    if params[:report]
        report_id = params[:id]
        @like = Like.new(user_id: current_user.id, report_id: params[:id], like: params[:report])
        if @like.save
            report = Report.find_by(id: params[:id])
            report.update(score: report.score += 1)
            flash[:success] = "Thank you for your feedback."
            # redirect_to "/reports/#{report_id}#likebutton"
            redirect_to "/reports/#{report_id}"#likebutton""
        end
    elsif params[:tip]
        @like = Like.create(user_id: current_user.id, tip_id: params[:id], like: params[:tip])
        flash[:success] = "Thank you for your feedback."
        redirect_to "/tips"
    elsif params[:answer]
        question_id = Answer.find_by(id: params[:id]).question.id
        @like = Like.create(user_id: current_user.id, answer_id: params[:id],like: params[:answer])
        flash[:success] = "Thank you for your feedback"
        redirect_to "/questions/#{question_id}"
    end
    end
end
