class QuestionsController < ApplicationController
  before_action :authenticate_user!, only: [:new_part_1]

  def new_part_1
    @countries = CS.countries
    render "new_part_1.html.erb"
  end

  def new_part_2
    @country = params[:country].split(',')[0]
    @full_country = params[:country].split(',')[1]
    @states = CS.states(@country.to_sym)
    render "new_part_2.html.erb"
  end

  def new_part_3
    @country = params[:country]
    @full_country = params[:full_country]
    @state = params[:state].split(',')[0]
    @full_state = params[:state].split(',')[1]
    @cities = CS.cities(@state.to_sym, @country.to_sym)
    render "new_part_3.html.erb"
  end

   def new_part_4
     @country = params[:country]
     @full_country = params[:full_country]
     @state = params[:state]
     @full_state = params[:full_state]
     @city = params[:city]
     render "new_part_4.html.erb"
  end

  def create
    if Location.find_by(city: params[:city], state: params[:full_state], country: params[:full_country])
        @location = Location.find_by(city: params[:city], state: params[:full_state], country: params[:full_country])
    else
        @location = Location.create(country: params[:full_country], state: params[:full_state], city: params[:city])
    end
    @question = Question.new(user_id: current_user.id, location_id: @location.id , question: params[:question])
    if @question.save
      flash[:success] = "Your question has been added"
      redirect_to "/questions/indexall"
    else
      flash[:error] = "Tip could not be saved"
      redirect_to "/questions/new"
    end
  end

  # def create
  #   @question = Question.create(user_id: current_user.id, location_id: params[:location_id], question: params[:question])
  #   redirect_to "/questions"
  # end

  def show
    if params[:notification]
        notification = Notification.find_by(id: params[:notification])
        notification.delete
    end
    @question = Question.find_by(id: params[:id])
    @answers = Answer.where(question_id: @question.id)
    render "show.html.erb"
  end

  def indexcity
    if params[:city]
         @questions = Location.where(country: params[:country], state: params[:state], city: params[:city]).first.questions.page(params[:page]).per(15)
    else
      @questions = Question.all.page(params[:page]).per(15)
    end
    @city = params[:city]
    render "indexcity.html.erb"
  end

  def indexall
    @questions = Question.all.order(:created_at => "desc").page(params[:page]).per(15)
    render "indexall.html.erb"
  end

  def destroy
    question = Question.find_by(id: params[:id])
    question.bookmarks.destroy_all
    question.notifications.destroy_all
    location = question.location
        if location.reports.length == 0 && location.tips.length ==0 && location.questions.length <=1
              location.destroy
        end
    question.destroy
    flash[:warning]= "Question has been deleted."
    redirect_to "/questions/indexall"
  end

end
