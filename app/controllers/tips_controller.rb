class TipsController < ApplicationController

  def new
    @locations = Location.all
    render "new.html.erb"
  end

  def create
    @tip = Tip.create(user_id: current_user.id, text: params[:text], venue: params[:name], category: params[:category], location_id: params[:location_id])
    redirect_to "/tips"
  end

  def index
    @tips = Tip.all 
    render "index.html.erb"
  end


end
