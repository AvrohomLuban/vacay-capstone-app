class LocationsController < ApplicationController

  def index
    @city_state_country = "country"
    if params[:country]
        @searching = params[:country]
        @locations = []
          Location.order(:state).all.where(country: params[:country]).each do |location|
             @locations << {"country" => location.country, "state" => location.state, "place" => location.state, "r_count" => Location.where(country: location.country, state: location.state).map{|location| location.reports.count }.inject(:+), "image" => Location.where(state: location.state).first.image, "q_count" => Location.where(country: location.country, state: location.state).map{|location| location.questions.count}.inject(:+), "t_count" => Location.where(country: location.country, state: location.state).map{|location| location.tips.count}.inject(:+)}
          end
        @city_state_country = "state"
        render "index.html.erb"
    elsif params[:state]
      @searching = params[:state]
        @locations = []
          Location.order(:city).all.where(state: params[:state]).each do |location|
            @locations << {"country" => location.country, "state" => location.state, "city" =>location.city, "place" => location.city, "r_count" => Location.where(country: location.country, state: location.state, city: location.city).map{|location| location.reports.count }.inject(:+), "image" => Location.where(city: location.city).first.image, "q_count" => Location.where(country: location.country, state: location.state, city: location.city).map{|location| location.questions.count}.inject(:+), "t_count" => Location.where(country: location.country, state: location.state, city: location.city).map{|location| location.tips.count}.inject(:+) }
          end
        @city_state_country = "city"
        render "index.html.erb"
    elsif params[:city]
        @country = params[:country_name]
        @city = params[:city]
        @state = params[:state_name]
        render "index_city.html.erb"
    else
        @locations = []
        # Country.find_by(name: params[:country_name])
        Location.order(:country).all.each do |location|
             @locations << {"country" => location.country, "place" => location.country, "r_count" => Location.where(country: location.country).map{|location| location.reports.count }.inject(:+), "image" => Location.where(country: location.country).first.image, "q_count" => Location.where(country: location.country).map{|location| location.questions.count}.inject(:+), "t_count" => Location.where(country: location.country).map{|location| location.tips.count}.inject(:+)}
        end
        render "index.html.erb"
    end
  end

  def index_version_for_just_reports
    @city_state_country = "country"
    if params[:country]
        @locations = []
          Report.all.each do | report |
          report.locations.where(country: params[:country]).each do |location|
             @locations << {"place" => location.state, "count" => Location.where(state: location.state).map{|location| location.reports.count }.inject(:+), "image" => Location.where(state: location.state).first.image}
          end
        end
        @city_state_country = "state"
        render "index.html.erb"
    elsif params[:state]
        @locations = []
          Report.all.each do | report |
          report.locations.where(state: params[:state]).each do |location|
            @locations << {"place" => location.city, "count" => Location.where(city: location.city).map{|location| location.reports.count }.inject(:+), "image" => Location.where(city: location.city).first.image}
          end
        end
        @city_state_country = "city"
        render "index.html.erb"
    elsif params[:city]
        redirect_to "/reports/indexcity/?city=#{params[:city]}"
    else
        @locations = []
        Report.all.each do | report |
        report.locations.each do |location|
             @locations << {"place" => location.country, "count" => Location.where(country: location.country).map{|location| location.reports.count }.inject(:+), "image" => Location.where(country: location.country).first.image}
        end
        end
        render "index.html.erb"
    end
  end

  def index_back_up
    @city_state_country = "country"
    if params[:country]
        @searching = params[:country]
        @locations = []
          Location.all.where(country: params[:country]).each do |location|
             @locations << {"place" => location.state, "r_count" => Location.where(state: location.state).map{|location| location.reports.count }.inject(:+), "image" => Location.where(state: location.state).first.image, "q_count" => Location.where(state: location.state).map{|location| location.questions.count}.inject(:+), "t_count" => Location.where(state: location.state).map{|location| location.tips.count}.inject(:+)}
          end
        @city_state_country = "state"
        render "index.html.erb"
    elsif params[:state]
      @searching = params[:state]
        @locations = []
          Location.all.where(state: params[:state]).each do |location|
            @locations << {"place" => location.city, "r_count" => Location.where(city: location.city).map{|location| location.reports.count }.inject(:+), "image" => Location.where(city: location.city).first.image, "q_count" => Location.where(city: location.city).map{|location| location.questions.count}.inject(:+), "t_count" => Location.where(city: location.city).map{|location| location.tips.count}.inject(:+) }
          end
        @city_state_country = "city"
        render "index.html.erb"
    elsif params[:city]
        @city = params[:city]
        render "index_city.html.erb"
    else
        @locations = []
        Location.all.each do |location|
             @locations << {"place" => location.country, "r_count" => Location.where(country: location.country).map{|location| location.reports.count }.inject(:+), "image" => Location.where(country: location.country).first.image, "q_count" => Location.where(country: location.country).map{|location| location.questions.count}.inject(:+), "t_count" => Location.where(country: location.country).map{|location| location.tips.count}.inject(:+)}
        end
        render "index.html.erb"
    end
  end
end
