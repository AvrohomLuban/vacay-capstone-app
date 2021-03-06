class Api::V1::ReportsController < ApplicationController

  def index
    @reports = Report.all
    render "index.json.jbuilder"
  end

  def create
    report = Report.new(title: params[:title], duration: params[:duration], season: params[:season], text: params[:text], user_id: params[:user_id], posted_live: params[:posted_live])
     if report.save
      render :json => {report: report, message:"Succesfully saved your report!!"}
    else
      render :json => {error: report.errors.full_messages.join(",")}
    end
  end

   def show
    @report = Report.find_by(id: params[:id])
    @city = @report.locations.first.city
    @others = Location.find_by(city: @city).reports.first(5)
    @comments = Comment.where(report_id: params[:id])
    render "show.json.jbuilder"
  end

end
