# frozen_string_literal: true

class PhotosController < ApplicationController
  def index
    @photos = Photo.all
  end

  def new
    @photo = Photo.new
  end

  def create
    photo = UploadService.new(Photo, photo_params).call

    notice_message = photo ? "Photo uploaded successfully." : "Photo upload failed."
    redirect_to photos_path, notice: notice_message
  end

  private

  def photo_params
    params.require(:photo).permit(:title, :image)
  end
end
