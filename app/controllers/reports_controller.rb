class ReportsController < ApplicationController
    before_action :authenticate_user!, only: [:create, :edit, :confirm, :post, :update, :new]

  def index
    if params[:rating]
         @reports = Report.all.order("likes DESC").where(posted_live: true)
    else
         @reports = Report.all.order(:created_at => "desc").where(posted_live: true)
    end
    @title = "Latest Trip Reports"
    render "index.html.erb"
  end

   def show
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

    def new_part_5
      @report = Report.new(title: params[:title], duration: params[:duration], season: params[:season], text: params[:text], user_id: current_user.id, posted_live: true)
      if @report.save
        if Location.find_by(city: params[:city], state: params[:full_state], country: params[:full_country])
            @location = Location.find_by(city: params[:city], state: params[:full_state], country: params[:full_country])
        else
            @location = Location.create(country: params[:full_country], state: params[:full_state], city: params[:city])
        end
        @destination = Destination.create(location_id: @location.id, report_id: @report.id )
        # @image1 = Image.create(url: params[:image1], report_id: @report.id)
        # @image2 = Image.create(url: params[:image2], report_id: @report.id)
        # @image3 = Image.create(url: params[:image3], report_id: @report.id)
        # @image4 = Image.create(url: params[:image4], report_id: @report.id)          
        # @image5 = Image.create(url: params[:image5], report_id: @report.id)
        # @image6 = Image.create(url: params[:image6], report_id: @report.id)
        # @image7 = Image.create(url: params[:image7], report_id: @report.id)
        # @image8 = Image.create(url: params[:image8], report_id: @report.id)
        # @image9 = Image.create(url: params[:image9], report_id: @report.id)
        # @image10 = Image.create(url: params[:image10], report_id: @report.id)
        # @image11 = Image.create(url: params[:image11], report_id: @report.id)
        # @image12 = Image.create(url: params[:image12], report_id: @report.id)

        img_array = params[:images]
        success_arr =[]
        img_array.each do | image | 
          success_arr << Photo.create(image: image, report_id: @report.id)
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
        render "new_vue.html.erb"
    end
end
