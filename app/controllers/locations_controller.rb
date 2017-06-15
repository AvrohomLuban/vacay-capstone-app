class LocationsController < ApplicationController

  def index
    @city_state_country = "country"
    if params[:country]
        @locations = []
        if Location.where(country: params[:country]).first.state != ""
              Location.where(country: params[:country]).each do |location|
                  @locations << location.state
              end
              @city_state_country = "state"
              render "index.html.erb"
        else 
              @locations = []
              Location.where(country: params[:country]).each do |location|
                  @locations << location.city
        end
        @city_state_country = "city"
        render "index.html.erb"
        end
    elsif params[:state]
      @locations = []
        Location.where(state: params[:state]).each do |location|
            @locations << location.city
        end
        @city_state_country = "city"
        render "index.html.erb"
    elsif params[:city]
        redirect_to "/reports/city/#{params[:city]}"
    else
        @locations = []
        Location.all.each do |location|
            @locations << location.country
        end
    end
  end

end
