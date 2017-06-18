class QuestionsController < ApplicationController

  def new
    @locations = Location.all
    render "new.html.erb"
  end

  def create
    @question = Question.create(user_id: current_user.id, location_id: params[:location_id], question: params[:question])
    redirect_to "/"
  end

  def show
    @question = Question.find_by(id: params[:id])
    @answers = Answer.where(question_id: params[:id])
    render "show.html.erb"
  end

  def index
    @questions = Question.all
    render "index.html.erb"
  end

end
