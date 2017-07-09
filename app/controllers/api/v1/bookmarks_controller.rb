class Api::V1::BookmarksController < ApplicationController

  def index
    @bookmarks = Bookmark.all
    render "index.json.jbuilder"
  end

  def create
    bookmark = Bookmark.new(user_id: current_user.id, report_id: params[:report_id], tip_id: params[:tip_id], question_id: params[:question_id])
     if bookmark.save
      render :json => {bookmark: bookmark, message:"Succesfully saved your bookmark!!"}
    else
      render :json => {error: bookmark.errors.full_messages.join(",")}
    end
  end

end
