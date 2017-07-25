class ProfilesController < ApplicationController

  def edit
    render "edit.html.erb"
  end

  def update
    photo = Photo.find_by(user_id: current_user.id)
    if photo
      photo.destroy
    end
    @photo = Photo.create(image: params[:image], user_id: current_user.id)
    redirect_to "/reports/indexall"
  end

end
