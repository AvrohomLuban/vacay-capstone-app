class Api::V1::DestinationsController < ApplicationController

   def index
    @desinations = Destination.all
    render "index.json.jbuilder"
  end

  def create
    destination = Destination.new(location_id: params[:location_id], report_id: params[:report_id])
     if destination.save
      render :json => {destination: destination, message:"Succesfully saved your destination!!"}
    else
      render :json => {error: destination.errors.full_messages.join(",")}
    end
  end


end
