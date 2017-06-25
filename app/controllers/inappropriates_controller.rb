class InappropriatesController < ApplicationController

  def create
    if params[:tip]
      @inappropriate = Inappropriate.create(tip_id: params[:id])
    elsif params[:report]
      @inappropriate = Inappropriate.create(report_id: params[:id])
    elsif params[:comment]
      @inappropriate = Inappropriate.create(comment_id: params[:id])
    elsif params[:cquestion]
      @inappropriate = Inappropriate.create(question_id: params[:id])
    elsif params[:answer]
      @inappropriate = Inappropriate.create(answer_id: params[:answer])
    end
    flash[:warning] = "Your report has been passed. An admin will look into it."
    redirect_to "/"
    end
end
