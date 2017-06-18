class GuidesController < ApplicationController
  before_action :authenticate_user!

  def new
    @locations = Location.all
    render "new.html.erb"
  end

  def create
    @guide = Guide.new(user_id: current_user.id, first_name: params[:first_name], last_name: params[:last_name], price: params[:price])
    @guide_location = GuideLocation.create(guide_id: @guide.id, location_id: params[:location_id], text: params[:description])
    if @guide.save
      flash[:success] = "You have succeesuly registered to become a local guide."
      redirect_to "/guides/#{@guide.id}"
    else flash[:warning] = @guide.errors.full_messages.join(" ,")
      redirect_to "/guides/new"
    end
  end

  def index
    @guides = Guide.all
    render "index.html.erb"
  end

  def show
    @guide = Guide.find_by(id: params[:id])
    render "show.html.erb"
  end

  def edit
    @guide = Guide.find_by(id: params[:id])
    @locations = Location.all
    render "edit.html.erb"
  end


end
