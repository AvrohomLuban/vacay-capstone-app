class BookmarksController < ApplicationController

  def create
    id = params[:id]
    if params[:report]
      @bookmark = Bookmark.new(user_id: current_user.id, report_id: params[:id])
      redirect_to "/reports/#{id}"
    elsif params[:tip]
      @bookmark = Bookmark.new(user_id: current_user.id, tip_id: params[:id])
      redirect_to "/tips/indexall#tip-#{params[:id]}"
    elsif params[:question]
      @bookmark = Bookmark.new(user_id: current_user.id, question_id: params[:id])
      question_id = params[:id]
      redirect_to "/questions/#{question_id}"
    end
    if @bookmark.save
      flash[:success] = "New bookmark has successfuly been created"
    else
      flash[:warning] = "Could not save your bookmark. #{@bookmark.errors.full_messages.join(", ")}."
    end
    
  end

  def index
    @bookmarked_reports = Bookmark.all.where(user_id: current_user.id, tip_id: nil, question_id: nil)
    @bookmarked_tips = Bookmark.all.where(user_id: current_user.id, report_id: nil, question_id: nil)
    @bookmarked_questions = Bookmark.all.where(user_id: current_user.id, report_id: nil, tip_id: nil)
    render "index.html.erb"
  end

  def destroy
    if params[:user]
      bookmark = Bookmark.where(user_id: current_user.id)
      bookmark.destroy_all
      flash[:warning] = "All bookmarks have been cleared."
    else
    bookmark = Bookmark.find_by(id: params[:id])
    bookmark.destroy
    flash[:warning] = "Bookmark has been removed."
    end
    redirect_to "/bookmarks"
  end

end
