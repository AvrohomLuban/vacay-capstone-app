class TipsController < ApplicationController

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
      redirect_to "/tips"
    else
      flash[:error] = "Tip could not be saved"
      redirect_to "/tips/new"
    end
  end

  def index
    @tips = Tip.all.order(:created_at => "desc")
    @comments = Comment.all
    render "index.html.erb"
  end


end
