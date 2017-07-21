class PhotosController < ApplicationController
  def new
    render "new.html.erb"
  end

  def create
    if params[:images]
      img_array = params[:images]
      success_arr =[]
      img_array.each do | image | 
        success_arr << Photo.new(title: params[:title], image: image)
      end
        if success_arr.all?{|photo_object| photo_object.save}
          flash[:success] = "The photos have been added!"
          redirect_to "/photos"
        else
          flash[:danger] = "Unsupported file type"
          render :new
        end
    end
  end

  def edit
    @report = Report.find_by(id: params[:id])
    render "edit.html.erb"
  end

  def delete
    photo = Photo.find_by(id: params[:id])
    report_id = params[:report]
    photo.destroy
    redirect_to "/reports/#{report_id}"
  end


end
