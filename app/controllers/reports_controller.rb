class ReportsController < ApplicationController
    before_action :authenticate_user!, only: [:create, :edit, :confirm, :post, :update, :new]

  def index
    if params[:rating]
         @reports = Report.all.order("likes DESC").where(posted_live: true).page(params[:page]).per(15)
    # elsif params[:like]
    #     @reports = Report.joins(:likes).where('likes.like = true').page(params[:page]).per(15)
    #following works but not with paginate
    # @reports = Report.all.sort_by{|report| report.likes.where(like: true).count}.reverse.page(params[:page]).per(15)
    elsif params[:abc]
        @reports = Report.all.order("title ASC").page(params[:page]).per(15)
    elsif params[:random]
        @reports = Report.all.order("RANDOM()").page(params[:page]).per(15)
    elsif params[:city]
        @reports = Location.where(city: params[:city]).first.reports.page(params[:page]).per(15)
        @city = params[:city]
    elsif params[:search]
        @reports = Report.where(title: params[:searchbox]).page(params[:page]).per(15)
    else
         @reports = Report.all.order(:created_at => "desc").where(posted_live: true).page(params[:page]).per(15)
    end
    @title = "Latest Trip Reports"
    render "index2.html.erb"
  end

   def show
    @report = Report.find_by(id: params[:id])
    @city = @report.locations.first.city
    @others = Location.find_by(city: @city).reports.first(5)
    @comments = Comment.where(report_id: params[:id])
    render "show_carousel_popup.html.erb"
    end

    def edit
    @report = Report.find_by(id: params[:id])
    render "edit2.html.erb"
    end

    def update
        @report = Report.find_by(id: params[:id])
        @report.update(title: params[:title], duration: params[:duration], season: params[:season], text: params[:text])
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

    def create
      @report = Report.new(title: params[:title], duration: params[:duration], season: params[:season], text: params[:text], user_id: current_user.id, posted_live: true)
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

    def newvue
        render "vue_new.html.erb"
    end
end
