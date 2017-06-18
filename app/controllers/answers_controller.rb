class AnswersController < ApplicationController

  def create
    @answer = Answer.create(user_id: current_user.id, question_id: params[:id], answer: params[:answer])
    redirect_to "/questions/#{params[:id]}"
  end

end
