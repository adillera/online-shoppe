class Admin::ImagesController < ApplicationController
  def destroy
    image = Image.find(params[:id])
    image.delete
  end
end
