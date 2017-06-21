class ReportsController < ApplicationController
    before_action :authenticate_user!, only: [:create, :edit, :confirm, :post, :update, :new]

  def city
    @reports = Location.find_by(city: params[:city]).reports.where(posted_live: true)
    @title = "All " + params[:city] + " Trip Reports"
    render "index.html.erb"
  end

  def index
    if params[:rating]
         @reports = Report.all.order(:likes.count => "desc").where(posted_live: true)
    else
         @reports = Report.all.order(:created_at => "desc").where(posted_live: true)
    end
    @title = "Latest Trip Reports"
    render "index.html.erb"
  end

  def new
    render "new.html.erb"
  end

  def create
    @report = Report.new(title: params[:title].titleize, duration: params[:duration], season: params[:season].titleize, text: params[:text], text_font: "handlee", posted_live: false,  user_id: current_user.id)
    if Location.find_by(city: params[:city].titleize, state: params[:state].titleize, country: params[:country].titleize)
        @location = Location.find_by(city: params[:city].titleize, state: params[:state].titleize, country: params[:country].titleize)
    else
    @location = Location.create(city: params[:city].titleize, state: params[:state].titleize, country: params[:country].titleize)
    end
    @destination = Destination.create(location_id: @location.id, report_id: @report.id)

    if Location.find_by(city: params[:city2].titleize, state: params[:state2].titleize, country: params[:country2].titleize)
        @location = Location.find_by(city: params[:city2].titleize, state: params[:state2].titleize, country: params[:country2].titleize)
    else
    @location = Location.create(city: params[:city2].titleize, state: params[:state2].titleize, country: params[:country2].titleize)
    end
    @destination = Destination.create(location_id: @location.id, report_id: @report.id)

    if Location.find_by(city: params[:city3].titleize, state: params[:state3].titleize, country: params[:country3].titleize)
        @location = Location.find_by(city: params[:city3].titleize, state: params[:state3].titleize, country: params[:country3].titleize)
    else
    @location = Location.create(city: params[:city3].titleize, state: params[:state3].titleize, country: params[:country3].titleize)
    end
    @destination = Destination.create(location_id: @location.id, report_id: @report.id)

    if Location.find_by(city: params[:city4].titleize, state: params[:state4].titleize, country: params[:country4].titleize)
        @location = Location.find_by(city: params[:city4].titleize, state: params[:state4].titleize, country: params[:country4].titleize)
    else
    @location = Location.create(city: params[:city4].titleize, state: params[:state4].titleize, country: params[:country4].titleize)
    end
    @destination = Destination.create(location_id: @location.id, report_id: @report.id)

    if Location.find_by(city: params[:city5].titleize, state: params[:state5].titleize, country: params[:country5].titleize)
        @location = Location.find_by(city: params[:city5].titleize, state: params[:state5].titleize, country: params[:country5].titleize)
    else
    @location = Location.create(city: params[:city5].titleize, state: params[:state5].titleize, country: params[:country5].titleize)
    end
    @destination = Destination.create(location_id: @location.id, report_id: @report.id)

    if @report.save 
        flash[:success] = "Your report has been added"
        redirect_to "/reports/confirm/#{@report.id}"
    else
        flash[:warning] = @report.errors.full_messages.join(", ")
        render "new.html.erb"
    end
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
    @comments = Comment.where(report_id: params[:id])
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
