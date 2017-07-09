class Api::V1::LocationsController < ApplicationController

  def index
    @locations = Location.all
    render "index.json.jbuilder"
  end

  def create
    location = Location.new(city: params[:city], state: params[:state], country: params[:country])
     if location.save
      render :json => {location: location, message:"Succesfully saved your location!!"}
    else
      render :json => {error: location.errors.full_messages.join(",")}
    end
  end

end
