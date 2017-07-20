class LocationsController < ApplicationController

  def index
    @city_state_country = "country"
    if params[:country]
        @locations = []
          Location.where(country: params[:country]).each do |location|
            @locations << location.state
          end
        @city_state_country = "state"
        render "index.html.erb"
    elsif params[:state]
        @locations = []
          Location.where(state: params[:state]).each do |location|
            @locations << location.city
          end
        @city_state_country = "city"
        render "index.html.erb"
    elsif params[:city]
        redirect_to "/reports/index/?city=#{params[:city]}"
    else
        @locations = []
        Location.all.each do |location|
            @locations << location.country
        end
        render "index.html.erb"
    end
  end

  def index_v2
    @city_state_country = "country"
    if params[:country]
        @locations = []
          Report.all.each do | report |
          report.locations.where(country: params[:country]).each do |location|
            @locations << location.state
          end
        end
        @city_state_country = "state"
        render "index.html.erb"
    elsif params[:state]
        @locations = []
          Report.all.each do | report |
          report.locations.where(state: params[:state]).each do |location|
            @locations << location.city
          end
        end
        @city_state_country = "city"
        render "index.html.erb"
    elsif params[:city]
        redirect_to "/reports/index/?city=#{params[:city]}"
    else
        @locations = []
        Report.all.each do | report |
        report.locations.each do |location|
            @locations << location.country
        end
        end
        # @countrycount = Location.where(country: "United States").map{|location| location.reports.count }.inject(:+)
        render "index.html.erb"
    end
  end

  def index_v3
    @city_state_country = "country"
    if params[:country]
        @locations = []
          Report.all.each do | report |
          report.locations.where(country: params[:country]).each do |location|
             @locations << {"place" => location.state, "count" => Location.where(state: location.state).map{|location| location.reports.count }.inject(:+)}
          end
        end
        @city_state_country = "state"
        render "index.html.erb"
    elsif params[:state]
        @locations = []
          Report.all.each do | report |
          report.locations.where(state: params[:state]).each do |location|
            @locations << {"place" => location.city, "count" => Location.where(city: location.city).map{|location| location.reports.count }.inject(:+)}
          end
        end
        @city_state_country = "city"
        render "index.html.erb"
    elsif params[:city]
        redirect_to "/reports/index/?city=#{params[:city]}"
    else
        @locations = []
        Report.all.each do | report |
        report.locations.each do |location|
             @locations << {"place" => location.country, "count" => Location.where(country: location.country).map{|location| location.reports.count }.inject(:+)}
        end
        end

        # @countrycount = Location.where(country: "United States").map{|location| location.reports.count }.inject(:+)
        render "index.html.erb"
    end
  end
end
