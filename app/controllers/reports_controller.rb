class ReportsController < ApplicationController

  def search
    @city_state_country = "country"
    if params[:country]
        @locations = []
        Location.where(country: params[:country]).each do |location|
            @locations << location.state
        end
        @city_state_country = "state"
        render "search.html.erb"
    elsif params[:state]
      @locations = []
        Location.where(state: params[:state]).each do |location|
            @locations << location.city
        end
        @city_state_country = "city"
        render "search.html.erb"
    elsif params[:city]
      # @locations = []
      # Location.where(city: params[:city]).each do |location|
      # #   @locations << location.destinations.report.title
      # end
        redirect_to "/reports/city/#{params[:city]}"
    else
        @locations = []
        Location.all.each do |location|
            @locations << location.country
        end
    end
    # render "search.html.erb"
  end

  def index
    @reports = Location.find_by(city: params[:city]).reports
    render "index.html.erb"
  end

  def create
    @report = Report.create(title: params[:title], duration: params[:duration], season: params[:season], text: params[:text], text_font: "handlee", posted_live: false,  user_id: current_user.id)
    if Location.find_by(city: params[:city].downcase.capitalize, state: params[:state].downcase.capitalize, country: params[:country].downcase.capitalize)
        @location = Location.find_by(city: params[:city].downcase.capitalize, state: params[:state].downcase.capitalize, country: params[:country].downcase.capitalize)
    else
    @location = Location.create(city: params[:city].downcase.capitalize, state: params[:state].downcase.capitalize, country: params[:country].downcase.capitalize)
    end
    @destination = Destination.create(location_id: @location.id, report_id: @report.id)
    redirect_to "/reports/#{@report.id}"
  end

  def confirm
    @report = Report.find_by(id: params[:id])
    @report.update(posted_live: true)
    flash[:success] = "Your trip has succeesfuly been added."
    redirect_to "/reports/#{@report.id}"
   end

   def show
    @report = Report.find_by(id: params[:id])
    render "show.html.erb"
    end

    def edit
        @report = Report.find_by(id: params[:id])
        render "edit.html.erb"
    end

    def update
    end

end
