class Api::V1::PhotosController < ApplicationController

  def index
    @photos = Photo.all
    render "index.json.jbuilder"
  end

  def create
    photo = Photo.new(title: params[:title], image: image)
     if photo.save
      render :json => {photo: photo, message:"Succesfully saved your photo!!"}
    else
      render :json => {error: photo.errors.full_messages.join(",")}
    end
  end


end
