class ReportsController < ApplicationController

  def city
    @reports = Location.find_by(city: params[:city]).reports.where(posted_live: true)
    @title = "All " + params[:city] + " Trip Reports"
    render "index.html.erb"
  end

  def index
    @reports = Report.all.order(:created_at => "desc").where(posted_live: true)
    @title = "Latest Trip Reports"
    render "index.html.erb"
  end

  def create
    @report = Report.create(title: params[:title].titleize, duration: params[:duration], season: params[:season].titleize, text: params[:text], text_font: "handlee", posted_live: false,  user_id: current_user.id)
    if Location.find_by(city: params[:city].titleize, state: params[:state].titleize, country: params[:country].titleize)
        @location = Location.find_by(city: params[:city].titleize, state: params[:state].titleize, country: params[:country].titleize)
    else
    @location = Location.create(city: params[:city].titleize, state: params[:state].titleize, country: params[:country].titleize)
    end
    @destination = Destination.create(location_id: @location.id, report_id: @report.id)
    redirect_to "/reports/confirm/#{@report.id}"
  end

  def confirm
    @report = Report.find_by(id: params[:id])
    @report.update(posted_live: true)
    flash[:success] = "Your trip has succeesfuly been added."
    redirect_to "/reports/#{@report.id}"
   end

   def post
    @report = Report.find_by(id: params[:id])
    render "post.html.erb"
   end

   def show
    @report = Report.find_by(id: params[:id])
    @comments = Comment.where(report_id: @report.id)
    render "show.html.erb"
    end

    def edit
    @report = Report.find_by(id: params[:id])
    render "edit.html.erb"
    end

    def update
        @report = Report.find_by(id: params[:id])
        @report.update(title: params[:title].titleize, duration: params[:duration], season: params[:season].titleize, text: params[:text])
        if Location.find_by(city: params[:city].titleize, state: params[:state].titleize, country:params[:country].titleize)
                 @location = Location.find_by(city: params[:city].titleize, state: params[:state].titleize, country: params[:country].titleize)
        else
                 @location = Location.create(city: params[:city].titleize, state: params[:state].titleize, country: params[:country].titleize)
        end
        @destination = @report.destinations.first
        @destination.update(location_id: @location.id)
        flash["success"] = "Changes have been saved!"
        redirect_to "/reports/#{@report.id}"

    end

end
