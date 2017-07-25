class AnswersController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  def create
    @answer = Answer.create(user_id: current_user.id, question_id: params[:id], answer: params[:answer])
    notification = Notification.create(user_id: @answer.question.user.id, question_id: @answer.question.id, answer_id: @answer.id)
    redirect_to "/questions/#{params[:id]}"
  end

  def edit
    @answer = Answer.find_by(id: params[:id])
    render "edit.html.erb"
  end

  def update
    @answer = Answer.find_by(id: params[:id])
    @answer.update(answer: params[:answer])
    question = @answer.question_id
    flash[:success] = "Your answer has been updated."
    redirect_to "/questions/#{question}"
  end

  def destroy
    answer = Answer.find_by(id: params[:id])
    question = answer.question_id
    answer.notifications.destroy_all
    # answer.notifications.each do | notification |
    #   if notification.comment
    #     notification.destroy
    #   end
    # end
    answer.destroy
    flash[:warning] = "Your answer has successfuly been deleted."
    redirect_to "/questions/#{question}"
  end

end
