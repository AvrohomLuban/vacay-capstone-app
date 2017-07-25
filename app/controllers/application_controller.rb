class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session

  def after_sign_in_path_for(resource)
    "/locations"
  end

  # def authenticate_user
  #   redirect_to “/users/sign_in” unless current_user
  # end

end
