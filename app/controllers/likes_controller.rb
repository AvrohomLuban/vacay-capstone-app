class LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    @like = Like.create(user_id: current_user.id, report_id: params[:id], like: params[:like])
    flash[:success] = "Thank you for your feedback."
    redirect_to "/"
    end
end
