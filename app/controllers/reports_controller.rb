class ReportsController < ApplicationController
     before_action :authenticate_user!, only: [:new_part_1]

  def indexcity
    if params[:rating]
        @reports = Location.where(country: params[:country], state: params[:state], city: params[:city]).first.reports.all.order("score DESC").page(params[:page]).per(15)
    elsif params[:abc]
        @reports = Location.where(country: params[:country], state: params[:state], city: params[:city]).first.reports.all.order("title ASC").page(params[:page]).per(15)
    elsif params[:random]
        @reports = Location.where(country: params[:country], state: params[:state], city: params[:city]).first.reports.all.order("RANDOM()").page(params[:page]).per(15)
    elsif params[:searchbox]
        @location = Location.where(country: params[:country], state: params[:state], city: params[:city])
        @reports = @location.first.reports.where("title ILIKE ? OR text ILIKE ?", "%#{params[:searchbox]}%", "%#{params[:searchbox]}%").page(params[:page]).per(15)
    elsif params[:city]
         @reports = Location.where(country: params[:country], state: params[:state], city: params[:city]).first.reports.all.order(:created_at => "desc").page(params[:page]).per(15)
     else
        @reports = Report.all.page(params[:page]).per(15)
    end
    @city = params[:city]
    @state = params[:state]
    @country = params[:country]
    # @about_city = Wikipedia.find( @city )
    @title = "Latest Trip Reports"
    render "indexcity.html.erb"
  end

   def show
    if params[:notification]
        notification = Notification.find_by(id: params[:notification])
        notification.destroy
    end
    @report = Report.find_by(id: params[:id])
    @city = @report.locations.first.city
    @others = Location.find_by(city: @city).reports.first(5)
    @comments = Comment.where(report_id: params[:id])
    render "show.html.erb"
    end

    def edit
    @report = Report.find_by(id: params[:id])
    render "edit2.html.erb"
    end

    def update
        @report = Report.find_by(id: params[:id])
        @report.update(title: params[:title], duration: params[:duration], season: params[:season], text: params[:text], about_author: params[:about_author])
        flash["success"] = "Changes have been saved!"
        redirect_to "/reports/#{@report.id}"

    end

    def new_part_1
        @countries = CS.countries
        render "new_part_1.html.erb"
    end

    def new_part_2
        @title = params[:title]
        @duration = params[:duration]
        @season = params[:season]
        @country = params[:country].split(',')[0]
        @full_country = params[:country].split(',')[1]
        @states = CS.states(@country.to_sym)
        render "new_part_2.html.erb"
    end

    def new_part_3
        @title = params[:title]
        @duration = params[:duration]
        @season = params[:season]
        @country = params[:country]
        @full_country = params[:full_country]
        @state = params[:state].split(',')[0]
        @full_state = params[:state].split(',')[1]
        @cities = CS.cities(@state.to_sym, @country.to_sym)
        render "new_part_3.html.erb"
    end

    def new_part_4
        @title = params[:title]
        @duration = params[:duration]
        @season = params[:season]
        @country = params[:country]
        @full_country = params[:full_country]
        @state = params[:state]
        @full_state = params[:full_state]
        @city = params[:city]
        render "new_part_4_version2.html.erb"
    end

    def new_images
        @report = Report.find_by(id: params[:id])
        render "new_images.html.erb"
    end

    def update_images
        @report = Report.find_by(id: params[:id])
        if params[:images] !=nil
                img_array = params[:images]
                success_arr =[]
                img_array.each do | key, image | 
                  success_arr << Photo.create(image: image, report_id: @report.id, subtitle: params[:subtitles][key])
                end
        end
        redirect_to "/reports/#{@report.id}"
    end

    def create
      @report = Report.new(title: params[:title].titleize, duration: params[:duration].titleize, season: params[:season].titleize, text: params[:text].capitalize, user_id: current_user.id, about_author: params[:about_author].capitalize ,posted_live: true)
      if @report.save
        if Location.find_by(city: params[:city], state: params[:full_state], country: params[:full_country])
            @location = Location.find_by(city: params[:city], state: params[:full_state], country: params[:full_country])
        else
            @location = Location.create(country: params[:full_country], state: params[:full_state], city: params[:city])
        end
        @destination = Destination.create(location_id: @location.id, report_id: @report.id )
            if params[:images] !=nil
                img_array = params[:images]
                success_arr =[]
                img_array.each do | key, image | 
                  success_arr << Photo.create(image: image, report_id: @report.id, subtitle: params[:subtitles][key])
            end
            
        end
             # if success_arr.all?{|photo_object| photo_object.save}
             #     flash[:success] = "The photos have been added!"
             #     redirect_to "/photos"
             # else
             #       flash[:danger] = "Unsupported file type"
             #      render :new
             # end

        flash[:success] = "Your Trip Report has successfully been posted."
        redirect_to "/reports/#{@report.id}"
    else
        flash[:warning] = "Report could not be saved." + @report.errors.full_messages.join(',')
        redirect_to "/reports/testing"
      end
    end


    def home
        reports = Report.all.order(:created_at => "desc").where(posted_live: true)
        @reports = reports[0...3]
        render "home.html.erb"
    end

    def indexall
    if params[:rating]
         @reports = Report.all.order('score DESC').page(params[:page]).per(15)
    elsif params[:abc]
        @reports = Report.all.order("title ASC").page(params[:page]).per(15)
    elsif params[:random]
        @reports = Report.all.order("RANDOM()").page(params[:page]).per(15)
    elsif params[:searchbox]
        reports = Report.where("title ILIKE ? OR text ILIKE ?", "%#{params[:searchbox]}%", "%#{params[:searchbox]}%")
        location = Location.all.where("country ILIKE ? OR state ILIKE ? OR city ILIKE?", "%#{params[:searchbox]}%", "%#{params[:searchbox]}%", "%#{params[:searchbox]}%").first
        reports += location.reports if location
        @reports = Report.where(id: reports.map(&:id)).page(params[:page]).per(15)
    else
         @reports = Report.all.order(:created_at => "desc").page(params[:page]).per(15)
    end
    render "indexall.html.erb"
    end

    def destroy
        report = Report.find_by(id: params[:id])
        report.bookmarks.destroy_all
        report.notifications.destroy_all
        location = report.locations.first
        if location.reports.length <= 1 && location.tips.length == 0 && location.questions.length == 0
                location.destroy
        end
        report.destroy
        flash[:warning]= "Report has been deleted."
        redirect_to "/reports/indexall"
    end

end
