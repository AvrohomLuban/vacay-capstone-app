class TipsController < ApplicationController
  before_action :authenticate_user!, only: [:new_part_1]

  def new_part_1
    @countries = CS.countries
    render "new_part_1.html.erb"
  end

  def new_part_2
    @country = params[:country].split(',')[0]
    @full_country = params[:country].split(',')[1]
    @states = CS.states(@country.to_sym)
    render "new_part_2.html.erb"
  end

  def new_part_3
    @country = params[:country]
    @full_country = params[:full_country]
    @state = params[:state].split(',')[0]
    @full_state = params[:state].split(',')[1]
    @cities = CS.cities(@state.to_sym, @country.to_sym)
    render "new_part_3.html.erb"
  end

   def new_part_4
     @country = params[:country]
     @full_country = params[:full_country]
     @state = params[:state]
     @full_state = params[:full_state]
     @city = params[:city]
     render "new_part_4.html.erb"
  end

  def create
    if Location.find_by(city: params[:city], state: params[:full_state], country: params[:full_country])
        @location = Location.find_by(city: params[:city], state: params[:full_state], country: params[:full_country])
    else
        @location = Location.create(country: params[:full_country], state: params[:full_state], city: params[:city])
    end
    @tip = Tip.new(user_id: current_user.id, text: params[:text], venue: params[:venue],location_id: @location.id)
    if @tip.save
      flash[:success] = "Your tip has been added"
      if params[:image]
        @photo = Photo.create(image: params[:image], tip_id: @tip.id)
      end
      redirect_to "/tips/indexall"
    else
      flash[:error] = "Tip could not be saved"
      redirect_to "/tips/new"
    end
  end

  def indexcity
    if params[:notification]
        notification = Notification.find_by(id: params[:notification])
        notification.delete
    end
    if params[:abc]
      @tips = Location.where(country: params[:country], state: params[:state], city: params[:city]).first.tips.order("venue ASC").page(params[:page]).per(15)
    elsif params[:rating]
         @tips = Location.where(country: params[:country], state: params[:state], city: params[:city]).first.tips.all.order("score DESC").page(params[:page]).per(15)
    elsif params[:random]
         @tips = Location.where(country: params[:country], state: params[:state], city: params[:city]).first.tips.all.order("RANDOM()").page(params[:page]).per(15)
    elsif params[:city]
         @tips = Location.where(country: params[:country], state: params[:state], city: params[:city]).first.tips.page(params[:page]).per(15)
          @city = params[:city]
    elsif params[:id]
        @tips = Tip.where(id: params[:id])
    else
      @tips = Tip.all.order(:created_at => "desc").page(params[:page]).per(15)
    end
    @city = params[:city]
    @state = params[:state]
    @country = params[:country]
    @comments = Comment.all
    render "index.html.erb"
  end

  def indexall

    if params[:notification]
        notification = Notification.find_by(id: params[:notification])
        notification.delete
    end
    if params[:abc]
      @tips = Tip.all.order("venue ASC").page(params[:page]).per(15)
    elsif params[:rating]
         @tips = Tip.all.order("score DESC").page(params[:page]).per(15)
    elsif params[:random]
         @tips = Tip.all.order("RANDOM()").page(params[:page]).per(15)
    elsif params[:id]
        @tips = Tip.where(id: params[:id])
    else
    @tips = Tip.all.order(:created_at => "desc").page(params[:page]).per(15)
    end
    if params[:editmode]
      @editmode = true
    else
      @editmode = false
    end
      render "indexall.html.erb"
    
  end


  def destroy
        tip = Tip.find_by(id: params[:id])
        tip.bookmarks.destroy_all
        tip.notifications.destroy_all
        location = tip.location
        if location.reports.length == 0 && location.tips.length <=0 && location.questions.length ==0
              location.destroy
        end
        tip.destroy
        flash[:warning]= "Tip has been deleted."
        redirect_to "/tips/indexall"
  end

  def edit
    @tip = Tip.find_by(id: params[:id])
    render "edit.html.erb"
  end

  def edit_image
    @tip = Tip.find_by(id: params[:id])
    render "edit_image.html.erb"
  end

  def update_image
    @tip = Tip.find_by(id: params[:id])
    photo = Photo.find_by(tip_id: @tip.id)
    if photo
      photo.destroy
    end
    @photo = Photo.create(image: params[:image], tip_id: @tip.id)
    redirect_to "/tips/indexall/?id=#{@tip.id}"
  end

  def update
    @tip = Tip.find_by(id: params[:id])
    @tip.update(venue: params[:venue], text: params[:text])
    flash[:success] = "Your tip changes have been saved"
    redirect_to "/tips/indexall/?id=#{@tip.id}"
  end


end
