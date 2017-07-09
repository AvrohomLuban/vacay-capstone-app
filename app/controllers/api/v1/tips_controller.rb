class Api::V1::TipsController < ApplicationController

  def index
    @tips = Tip.all
    render "index.json.jbuilder"
  end

  def create
    tip = Tip.new(text: params[:text], venue: params[:venue], user_id: params[:user_id], location_id: params[:location_id])
     if tip.save
      render :json => {tip: tip, message:"Succesfully saved your tip!!"}
    else
      render :json => {error: tip.errors.full_messages.join(",")}
    end
  end

end
