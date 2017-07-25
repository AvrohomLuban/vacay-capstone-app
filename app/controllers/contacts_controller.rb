class ContactsController < ApplicationController
  def index
    render "index.html.erb"
  end

  def create
    @name = params[:name]
    @message = params[:message]
    @email = params[:email]
    UserMailer.contact_us(@name, @email, @message).deliver_now!
    flash[:success] = "Your message has been sent"
    redirect_to "/locations"
  end
end
