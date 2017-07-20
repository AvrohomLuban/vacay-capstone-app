class ForumsController < ApplicationController

  def index 
    render "index.html.erb"
  end

  def show
    render "show.html.erb"
  end

  def new
    render "new.html.erb"
  end

  def create
    @forum = Forum.create(title: params[:title])
    @comment = Comment.create(text: params[:comment], forum_id: @forum.id, user_id: current_user.id)
    redirect_to "/reports/indexall"
  end
end
